#include "chiyotatsu_util.hpp"
#include "kotatsu_utils.hpp"
#include "tachiyomi_utils.hpp"

using namespace kotatsu;
using namespace std;

namespace chiyotatsu
{
KotatsuBackup *chiyototatsu(Backup *tachiyomiBackup, KotatsuBackup *reference)
{
    // (To be copied over if there's a reference file)
    // Index, History, Bookmarks, Sources, Settings
    // Categories (kotatsu) + categories (tachiyomi, prepended with chtsu)
    // Favourites (kotatsu) + MangaBackups (tachiyomi)

    // Append categories
    for (auto tCat : tachiyomiBackup->categories()) {
        Categories kCat;
        kCat.created_at  = time(NULL);
        kCat.category_id = reference->categories.size();
        kCat.title       = "CHTSU - ";
        kCat.title.append(tCat.name());

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

        string source       = tachiyomi::PBoneSourceIDs.at(tManga.source());
        transform(source.begin(), source.end(), source.begin(), ::toupper);
        kManga.manga.source    = source;

        // Needs the full url but tachiyomi only keeps the partial one?
        // Gotta change the hashmap
        kManga.manga.url       = tManga.url();
        kManga.manga.cover_url = tManga.thumbnailurl();

        // Rando default values again
        kManga.manga.nsfw      = false;
        kManga.manga.rating    = 4.20F;
    }

    return reference;
}
} // namespace chiyotatsu
