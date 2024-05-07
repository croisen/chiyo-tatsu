#include <ctime>

#include "../compiled_proto/backup_category.pb.h"
#include "../compiled_proto/tachiyomi.pb.h"

#include "chiyotatsu_util.hpp"
#include "kotatsu_utils.hpp"
#include "tachiyomi_utils.hpp"

using namespace kotatsu;
using namespace std;

namespace chiyotatsu
{
void chiyototatsu(const Backup *tachiyomiBackup, KotatsuBackup *reference)
{
    // (To be copied over if there's a reference file)
    // Index, History, Bookmarks, Sources, Settings
    // Categories (kotatsu) + categories (tachiyomi, prepended with chtsu)
    // Favourites (kotatsu) + MangaBackups (tachiyomi)

    // Append categories
    int64_t origCatCount = reference->categories.size();
    for (auto tCat : tachiyomiBackup->categories()) {
        Categories kCat;
        kCat.created_at  = time(NULL);
        kCat.category_id = origCatCount + tCat.order();
        kCat.title       = "CHTSU - " + tCat.name();

        // Rando default values
        kCat.show_in_lib = true;
        kCat.track       = false;
        kCat.order       = "NEWEST";
        kCat.sort_key    = reference->categories.size();

        reference->categories.push_back(kCat);
    }

    for (auto tManga : tachiyomiBackup->mangabackup()) {
        Favourites kManga;

        kManga.manga.title  = tManga.title();
        kManga.manga.author = tManga.author();

        tachiyomi::TachiyomiSource source =
            tachiyomi::PBoneSourceIDs.at(tManga.source());
        transform(
            source.name.begin(), source.name.end(), source.name.begin(),
            ::toupper
        );
        kManga.manga.source    = source.name;
        kManga.manga.url       = source.baseUrl + tManga.url();
        kManga.manga.cover_url = source.baseUrl + tManga.thumbnailurl();

        // Rando values again
        kManga.manga.nsfw      = false;
        kManga.manga.rating    = 4.20F;
        kManga.manga.tags      = {};
        kManga.manga.id        = 0;
        kManga.manga.alt_title = "";

        // Rando values again
        kManga.category_id =
            reference->categories.size() - 1; // Last one for now
        kManga.created_at  = time(NULL);
        kManga.manga_id    = 0;
        kManga.sort_key    = 0;

        // tManga.status(); I dunno what this enum turns out to be
        kManga.manga.state = "";

        reference->favourites.push_back(kManga);
    }
}
} // namespace chiyotatsu
