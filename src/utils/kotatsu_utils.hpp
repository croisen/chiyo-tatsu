#ifndef __CHIYOTATSU_KOTATSU_BACKUP__
#define __CHIYOTATSU_KOTATSU_BACKUP__
#include <cstdint>
#include <string>
#include <vector>

namespace kotatsu
{
typedef struct Tags {
    int64_t id;
    std::string title;
    std::string key;
    std::string source;
} Tags;

typedef struct Manga {
    int64_t id;
    std::string title;
    std::string alt_title;
    std::string url;
    std::string public_url;
    double rating;
    bool nsfw;
    std::string cover_url;
    std::string state;
    std::string author;
    std::string source;
    std::vector<Tags> tags;
} Manga;

typedef struct Index {
    // Maybe these values are better off when copied from that
    // reference kotatsu file
    std::string app_id = "org.koitharu.kotatsu";
    uint64_t app_version;
    uint64_t created_at;
} Index;

typedef struct History {
    // Maybe this is better to be empty and not try to read the tachiyomi
    // history and convert it to here after all?
    int64_t manga_id;
    uint64_t created_at;
    uint64_t updated_at;
    uint64_t chapter_id;
    uint64_t page;
    uint64_t scroll;
    double percent;
} History;

typedef struct Categories {
    uint64_t category_id;
    uint64_t created_at;
    int64_t sort_key;
    std::string title;
    std::string order;
    bool track;
    bool show_in_lib;
} Categories;

typedef struct Favourites {
    Manga manga;
} Favourites;

typedef struct Sources {
    std::string source;
    bool enabled;
    int64_t sort_key;
} Sources;

typedef struct KotatsuBackup {
    std::vector<Index> index           = std::vector<Index>();
    std::vector<History> history       = std::vector<History>();
    std::vector<Categories> categories = std::vector<Categories>();
    std::vector<Favourites> favourites = std::vector<Favourites>();
    std::vector<Sources> sources       = std::vector<Sources>();
    // bookmarks;
    // settings;
} KotatsuBackup;

void saveToFile(std::string zipName, KotatsuBackup *kotatsuBackup);
KotatsuBackup readReference(std::string reference);
} // namespace kotatsu

#endif /* ifndef __CHIYOTATSU_KOTATSU_BACKUP__ */
