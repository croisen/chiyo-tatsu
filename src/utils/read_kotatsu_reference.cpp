#include <cstdlib>
#include <cstring>
#include <ctime>
#include <string>

#include "libzippp/libzippp.h"
#include "json/reader.h"
#include "json/value.h"

#include "col_lim_fprintf.hpp"
#include "kotatsu_utils.hpp"

using namespace libzippp;
using namespace std;

static bool parseKotatsuJson(
    const char *name, const char *txt, kotatsu::KotatsuBackup *kBackup
)
{
    Json::Value root;
    Json::Reader reader;
    string iText = (txt == NULL) ? "" : string(txt);

    if (!reader.parse(iText, root)) {
        chiyotatsuLog(
            CHCRIT, "Kotatsu backup contains invalid json in file: %s\n", name
        );
        return false;
    }

    if (strcmp(name, "index") == 0) {
        for (auto idx : root) {
            kotatsu::Index index;
            index.app_id      = idx["app_id"].asString();
            index.app_version = idx["app_version"].asUInt64();
            index.created_at  = time(NULL);
            kBackup->index.push_back(index);
        }

        return true;
    }

    if (strcmp(name, "history") == 0) {
        for (auto hist : root) {
            kotatsu::History history;
            history.chapter_id = hist["chapter_id"].asInt64();
            history.created_at = hist["created_at"].asUInt64();
            history.manga_id   = hist["manga_id"].asInt64();
            history.page       = hist["page"].asUInt64();
            history.percent    = hist["percent"].asDouble();
            history.scroll     = hist["scroll"].asUInt64();
            history.updated_at = hist["updated_at"].asUInt64();
            kBackup->history.push_back(history);
        }

        return true;
    }

    if (strcmp(name, "categories") == 0) {
        for (auto cat : root) {
            kotatsu::Categories category;
            category.category_id = cat["category_id"].asUInt64();
            category.created_at  = cat["created_at"].asUInt64();
            category.order       = cat["order"].asString();
            category.show_in_lib = cat["show_in_lib"].asBool();
            category.sort_key    = cat["sort_key"].asInt64();
            category.title       = cat["title"].asString();
            category.track       = cat["track"].asBool();
            kBackup->categories.push_back(category);
        }

        return true;
    }

    if (strcmp(name, "favourites") == 0) {
        for (auto fav : root) {
            kotatsu::Favourites favourite;
            favourite.manga.alt_title  = fav["alt_title"].asString();
            favourite.manga.title      = fav["title"].asString();
            favourite.manga.author     = fav["author"].asString();
            favourite.manga.cover_url  = fav["cover_url"].asString();
            favourite.manga.id         = fav["id"].asInt64();
            favourite.manga.nsfw       = fav["nsfw"].asBool();
            favourite.manga.public_url = fav["public_url"].asString();
            favourite.manga.rating     = fav["rating"].asDouble();
            favourite.manga.source     = fav["source"].asString();
            favourite.manga.state      = fav["state"].asString();
            favourite.manga.url        = fav["url"].asString();
            for (auto tag : fav) {
                kotatsu::Tags tags;
                tags.id     = fav["id"].asInt64();
                tags.key    = fav["key"].asString();
                tags.source = fav["source"].asString();
                tags.title  = fav["title"].asString();
                favourite.manga.tags.push_back(tags);
            }

            kBackup->favourites.push_back(favourite);
        }

        return true;
    }

    if (strcmp(name, "bookmarks") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse bookmarks\n");
        kBackup->bookmarks = root;
        return true;
    }

    if (strcmp(name, "sources") == 0) {
        for (auto src : root) {
            kotatsu::Sources source;
            source.enabled  = src["enabled"].asBool();
            source.sort_key = src["sort_key"].asInt64();
            source.source   = src["source"].asString();
            kBackup->sources.push_back(source);
        }

        return true;
    }

    if (strcmp(name, "settings") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse settings\n");
        kBackup->settings = root;
        return true;
    }

    chiyotatsuLog(
        CHCRIT, "Kotatsu backup contains a file I do not know of yet: %s\n",
        name
    );
    return false;
}

namespace kotatsu
{
KotatsuBackup readReference(string reference)
{
    KotatsuBackup kBackup;
    ZipArchive kZipRef(reference);
    kZipRef.open(ZipArchive::ReadOnly);
    vector<ZipEntry> kModules = kZipRef.getEntries();
    for (auto kModule : kModules)
        parseKotatsuJson(
            kModule.getName().c_str(), kModule.readAsText().c_str(), &kBackup
        );

    kZipRef.close();
    return kBackup;
}
} // namespace kotatsu
