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
    const char *name, const char *txt, kotatsu::KotatsuBackup &kBackup
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
            kBackup.index.push_back(index);
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
            kBackup.history.push_back(history);
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
            kBackup.categories.push_back(category);
        }

        return true;
    }

    if (strcmp(name, "favourites") == 0) {
        for (auto fav : root) {
            kotatsu::Favourites favourite;
            favourite.category_id      = fav["category_id"].asInt64();
            favourite.created_at       = fav["created_at"].asUInt64();
            favourite.manga_id         = fav["manga_id"].asInt64();
            favourite.sort_key         = fav["sort_key"].asInt64();
            favourite.manga.alt_title  = fav["manga"]["alt_title"].asString();
            favourite.manga.title      = fav["manga"]["title"].asString();
            favourite.manga.author     = fav["manga"]["author"].asString();
            favourite.manga.cover_url  = fav["manga"]["cover_url"].asString();
            favourite.manga.id         = fav["manga"]["id"].asInt64();
            favourite.manga.nsfw       = fav["manga"]["nsfw"].asBool();
            favourite.manga.public_url = fav["manga"]["public_url"].asString();
            favourite.manga.rating     = fav["manga"]["rating"].asDouble();
            favourite.manga.source     = fav["manga"]["source"].asString();
            favourite.manga.state      = fav["manga"]["state"].asString();
            favourite.manga.url        = fav["manga"]["url"].asString();
            for (auto tag : fav["manga"]["tags"]) {
                kotatsu::Tags tags;
                tags.id     = tag["id"].asInt64();
                tags.key    = tag["key"].asString();
                tags.source = tag["source"].asString();
                tags.title  = tag["title"].asString();
                favourite.manga.tags.push_back(tags);
            }

            kBackup.favourites.push_back(favourite);
        }

        return true;
    }

    if (strcmp(name, "bookmarks") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse bookmarks\n");
        kBackup.bookmarks = root;
        return true;
    }

    if (strcmp(name, "sources") == 0) {
        for (auto src : root) {
            kotatsu::Sources source;
            source.enabled  = src["enabled"].asBool();
            source.sort_key = src["sort_key"].asInt64();
            source.source   = src["source"].asString();
            kBackup.sources.push_back(source);
        }

        return true;
    }

    if (strcmp(name, "settings") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse settings\n");
        kBackup.settings = root;
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
    for (auto kModule : kModules) {
        chiyotatsuLog(
            CHINFO, "Now parsing kotatsu module: %s\n",
            kModule.getName().c_str()
        );
        parseKotatsuJson(
            kModule.getName().c_str(), kModule.readAsText().c_str(), kBackup
        );
    }

    kZipRef.close();
    return kBackup;
}
} // namespace kotatsu
