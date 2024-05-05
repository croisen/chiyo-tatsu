#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <string>

#include "zip.h"
#include "json/reader.h"
#include "json/value.h"

#include "col_lim_fprintf.hpp"
#include "kotatsu_utils.hpp"
#include "memtracker_pair.h"

using namespace std;

static bool parseKotatsuJson(
    const char *name, const char *txt, kotatsu::KotatsuBackup kBackup
)
{
    Json::Value root;
    Json::Reader reader;
    string iText = string();
    if (txt != NULL)
        iText = string(txt);

    if (!reader.parse(iText, root)) {
        chiyotatsuLog(
            CHCRIT, "Kotatsu backup contains invalid json in file: %s\n", name
        );
        return false;
    }

    if (strcmp(name, "index") == 0) {
        for (unsigned int i = 0; i < root.size(); i += 1) {
            kotatsu::Index index;
            index.app_id      = root[i]["app_id"].asString();
            index.app_version = root[i]["app_version"].asUInt64();
            index.created_at  = root[i]["created_at"].asUInt64();
            kBackup.index.push_back(index);
        }

        return true;
    }

    if (strcmp(name, "history") == 0) {
        for (unsigned int i = 0; i < root.size(); i += 1) {
            kotatsu::History hist;
            hist.chapter_id = root[i]["chapter_id"].asInt64();
            hist.created_at = root[i]["created_at"].asUInt64();
            hist.manga_id   = root[i]["manga_id"].asInt64();
            hist.page       = root[i]["page"].asUInt64();
            hist.percent    = root[i]["percent"].asDouble();
            hist.scroll     = root[i]["scroll"].asUInt64();
            hist.updated_at = root[i]["updated_at"].asUInt64();
            kBackup.history.push_back(hist);
        }

        return true;
    }

    if (strcmp(name, "categories") == 0) {
        for (unsigned int i = 0; i < root.size(); i += 1) {
            kotatsu::Categories cat;
            cat.category_id = root[i]["category_id"].asUInt64();
            cat.created_at  = root[i]["created_at"].asUInt64();
            cat.order       = root[i]["order"].asString();
            cat.show_in_lib = root[i]["show_in_lib"].asBool();
            cat.sort_key    = root[i]["sort_key"].asInt64();
            cat.title       = root[i]["title"].asString();
            cat.track       = root[i]["track"].asBool();
            kBackup.categories.push_back(cat);
        }

        return true;
    }

    if (strcmp(name, "favourites") == 0) {
        for (unsigned int i = 0; i < root.size(); i += 1) {
            kotatsu::Favourites fav;
            fav.manga.alt_title  = root[i]["alt_title"].asString();
            fav.manga.title      = root[i]["title"].asString();
            fav.manga.author     = root[i]["author"].asString();
            fav.manga.cover_url  = root[i]["cover_url"].asString();
            fav.manga.id         = root[i]["id"].asInt64();
            fav.manga.nsfw       = root[i]["nsfw"].asBool();
            fav.manga.public_url = root[i]["public_url"].asString();
            fav.manga.rating     = root[i]["rating"].asDouble();
            fav.manga.source     = root[i]["source"].asString();
            fav.manga.state      = root[i]["state"].asString();
            fav.manga.url        = root[i]["url"].asString();
            for (unsigned int ii = 0; i < root[i]["tags"].size(); i += 1) {
                kotatsu::Tags tag;
                tag.id     = root[i]["tags"][ii]["id"].asInt64();
                tag.key    = root[i]["tags"][ii]["key"].asString();
                tag.source = root[i]["tags"][ii]["source"].asString();
                tag.title  = root[i]["tags"][ii]["title"].asString();
                fav.manga.tags.push_back(tag);
            }

            kBackup.favourites.push_back(fav);
        }

        return true;
    }

    if (strcmp(name, "bookmarks") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse bookmarks\n");
        return true;
    }

    if (strcmp(name, "sources") == 0) {
        for (unsigned int i = 0; i < root.size(); i += 1) {
            kotatsu::Sources src;
            src.enabled  = root[i]["enabled"].asBool();
            src.sort_key = root[i]["sort_key"].asInt64();
            src.source   = root[i]["source"].asString();
            kBackup.sources.push_back(src);
        }

        return true;
    }

    if (strcmp(name, "settings") == 0) {
        chiyotatsuLog(CHWARN, "Idk how to parse settings\n");
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
    int res        = 0;
    zip_t *kZipRef = zip_open(reference.c_str(), ZIP_RDONLY, &res);
    if (kZipRef == NULL) {
        zip_error_t err;
        zip_error_init_with_code(&err, res);
        chiyotatsuLog(
            CHFAIL, "Failed to read kotatsu reference file: '%s'\nError: %s\n",
            reference.c_str(), zip_error_strerror(&err)
        );
        zip_error_fini(&err);
        exit(EXIT_FAILURE);
    }

    struct zip_stat *kZipInfo =
        (struct zip_stat *)mTCalloc(1, sizeof(struct zip_stat));
    zip_stat_init(kZipInfo);

    zip_file_t *kZipFD = nullptr;
    char *txt          = nullptr;
    int64_t count      = 0;
    while (zip_stat_index(kZipRef, count, 0, kZipInfo) == 0) {
        txt    = (char *)mTCalloc(kZipInfo->size + 1, sizeof(char));
        kZipFD = zip_fopen_index(kZipRef, count, 0);
        zip_fread(kZipFD, txt, kZipInfo->size);
        chiyotatsuLog(CHINFO, "Parsing kotatsu file: %s\n", kZipInfo->name);
        if (!parseKotatsuJson(kZipInfo->name, txt, kBackup))
            goto parsing_json_failed; // HAHAHAHAHAHAHAHAHAA

        zip_fclose(kZipFD);
        mTFree(txt);
        count += 1;
    }

    zip_close(kZipRef);
    return kBackup;

parsing_json_failed:
    mTFree(txt);
    zip_fclose(kZipFD);
    zip_close(kZipRef);
    exit(EXIT_FAILURE);
}
} // namespace kotatsu
