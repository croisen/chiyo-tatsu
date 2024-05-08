#include "json/forwards.h"
#include <iostream>
#include <string>

#include "libzippp/libzippp.h"
#include "json/value.h"
#include "json/writer.h"

#include "kotatsu_utils.hpp"

using namespace libzippp;
using namespace std;

namespace kotatsu
{
void saveToFile(string zipName, const KotatsuBackup kotatsuBackup)
{
    Json::Value index, history, categories, favourites, sources;
    Json::StyledWriter writer;
    Json::StyledStreamWriter writer2;
    string indexs, historys, categoriess, favouritess, bookmarkss, sourcess,
        settingss;

    for (auto idx : kotatsuBackup.index) {
        index[0]["app_id"]      = idx.app_id;
        index[0]["app_version"] = idx.app_version;
        index[0]["created_at"]  = idx.created_at;
    }

    for (unsigned int i = 0; i < kotatsuBackup.history.size(); i += 1) {
        history[i]["chapter_id"] = kotatsuBackup.history[i].chapter_id;
        history[i]["created_at"] = kotatsuBackup.history[i].created_at;
        history[i]["manga_id"]   = kotatsuBackup.history[i].manga_id;
        history[i]["page"]       = kotatsuBackup.history[i].page;
        history[i]["percent"]    = kotatsuBackup.history[i].percent;
        history[i]["scroll"]     = kotatsuBackup.history[i].scroll;
        history[i]["updated_at"] = kotatsuBackup.history[i].updated_at;
    }

    for (unsigned int i = 0; i < kotatsuBackup.categories.size(); i += 1) {
        categories[i]["category_id"] = kotatsuBackup.categories[i].category_id;
        categories[i]["created_at"]  = kotatsuBackup.categories[i].created_at;
        categories[i]["order"]       = kotatsuBackup.categories[i].order;
        categories[i]["show_in_lib"] = kotatsuBackup.categories[i].show_in_lib;
        categories[i]["sort_key"]    = kotatsuBackup.categories[i].sort_key;
        categories[i]["title"]       = kotatsuBackup.categories[i].title;
        categories[i]["track"]       = kotatsuBackup.categories[i].track;
    }

    for (unsigned int i = 0; i < kotatsuBackup.favourites.size(); i += 1) {
        favourites[i]["category_id"] = kotatsuBackup.favourites[i].category_id;
        favourites[i]["created_at"]  = kotatsuBackup.favourites[i].created_at;
        favourites[i]["manga_id"]    = kotatsuBackup.favourites[i].manga_id;
        favourites[i]["sort_key"]    = kotatsuBackup.favourites[i].sort_key;
        favourites[i]["manga"]["alt_title"] =
            kotatsuBackup.favourites[i].manga.alt_title;
        favourites[i]["manga"]["title"] =
            kotatsuBackup.favourites[i].manga.title;
        favourites[i]["manga"]["author"] =
            kotatsuBackup.favourites[i].manga.author;
        favourites[i]["manga"]["cover_url"] =
            kotatsuBackup.favourites[i].manga.cover_url;
        favourites[i]["manga"]["id"]   = kotatsuBackup.favourites[i].manga.id;
        favourites[i]["manga"]["nsfw"] = kotatsuBackup.favourites[i].manga.nsfw;
        favourites[i]["manga"]["source"] =
            kotatsuBackup.favourites[i].manga.source;
        favourites[i]["manga"]["state"] =
            kotatsuBackup.favourites[i].manga.state;
        favourites[i]["manga"]["rating"] =
            kotatsuBackup.favourites[i].manga.rating;
        favourites[i]["manga"]["public_url"] =
            kotatsuBackup.favourites[i].manga.public_url;
        favourites[i]["manga"]["url"] = kotatsuBackup.favourites[i].manga.url;
        for (unsigned int ii                                         = 0;
             ii < kotatsuBackup.favourites[i].manga.tags.size(); ii += 1) {
            favourites[i]["manga"]["tags"][ii]["id"] =
                kotatsuBackup.favourites[i].manga.tags[ii].id;
            favourites[i]["manga"]["tags"][ii]["key"] =
                kotatsuBackup.favourites[i].manga.tags[ii].key;
            favourites[i]["manga"]["tags"][ii]["title"] =
                kotatsuBackup.favourites[i].manga.tags[ii].title;
            favourites[i]["manga"]["tags"][ii]["source"] =
                kotatsuBackup.favourites[i].manga.tags[ii].source;
        }
    }

    for (unsigned int i = 0; i < kotatsuBackup.sources.size(); i += 1) {
        sources[i]["enabled"]  = kotatsuBackup.sources[i].enabled;
        sources[i]["sort_key"] = kotatsuBackup.sources[i].sort_key;
        sources[i]["source"]   = kotatsuBackup.sources[i].source;
    }

    indexs      = writer.write(index);
    historys    = writer.write(history);
    categoriess = writer.write(categories);
    favouritess = writer.write(favourites);
    bookmarkss  = writer.write(kotatsuBackup.bookmarks);
    sourcess    = writer.write(sources);
    settingss   = writer.write(kotatsuBackup.settings);

    ZipArchive kZip(zipName);
    kZip.open(ZipArchive::New);
    kZip.addData("index", indexs.data(), indexs.size());
    kZip.addData("history", historys.data(), historys.size());
    kZip.addData("categories", categoriess.data(), categoriess.size());
    kZip.addData("favourites", favouritess.data(), favouritess.size());
    kZip.addData("bookmarks", bookmarkss.data(), bookmarkss.size());
    kZip.addData("sources", sourcess.data(), sourcess.size());
    kZip.addData("settings", settingss.data(), settingss.size());
    kZip.close();
}
} // namespace kotatsu
