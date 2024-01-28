#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_PARSE
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_PARSE

// I'm starting to think that this parser I made is mainly used
// by me just for the memtracker and __darr_for_ptr struct
#include "bread_parser.h"

struct __tachiyomi_books
{
    // Orig tachiyomi stuff (1-18)
    int64_t source_id;   // Manga site id by tachiyomi
    char *source_url;    // Manga site url
    char *title;         // (cannot be null, but can be empty)
    char *artist;        // (can be null)
    char *author;        // (can be null)
    char *description;   // (can be null)
    char **genre;        // Can be an empty list? So (can be null)
    int64_t status;      // (int32)
    char *thumbnail_url; // Doesn't seem like it's needed for convertion
    char *custom_cover;
    int64_t last_update;
    int64_t last_init;
    int64_t date_added;  // Maybe this uses the unix time?
    int64_t viewer;      // (int32)
    int64_t flags;       // (int32)
    char **chapters;     // Might need a separate struct type
    int64_t *categories; // List of int64?
    char **tracking;     // Again might need a separate struct type

    // Tachiyomi stuff that's not used in 1.x but used in 0.x (100-105)
    bool favorite;
    int64_t chapter_flags;   // (int32)
    char **broken_history;   // Might need a separate struct type
    int64_t viewer_flags;    // (int32)
    char **history;          // Might need a separate struct type
    int64_t update_strategy; // Seems like an enum (defaults to ALWAYS_UPDATE)

    // SY(?) specific values (600 - 602)
    char **merged_manga_references; // Might need another separate struct type
    char *flat_metadata;            // Might need another separate struct type
    int64_t custom_status;          // (int32)

    // J2K(?) specific values (800 - 805 (can be null everywhere))
    char *custom_title;
    char *custom_artist;
    char *custom_author;
    // 803 skipped for duped vals or smth
    char *custom_description;
    char **custom_genre;

    // Neko specific values (900, 902, 901 (weird order but can be null
    // everyhere as well))
    char *merged_manga_url;
    char *merged_manga_image_url;
    char *scanlator_filter;
};

typedef struct __darr_for_ptr T_Book_List;
typedef struct __tachiyomi_books Tachiyomi_Books;
typedef struct __tachiyomi_books *T_Book_Ptr;

void tachiyomi_data_parse(unsigned char *input_data, T_Book_List *books,
                          uint64_t len);
void tachiyomi_books_print(T_Book_List *books);

#endif
