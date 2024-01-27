#ifndef CROI_APP_CHIYO_TATSU_TACHIYOMI_PARSE
#define CROI_APP_CHIYO_TATSU_TACHIYOMI_PARSE

// I'm starting to think that this parser I made is mainly used
// by me just for the memtracker and __darr_for_ptr struct
#include "bread_parser.h"

struct __tachiyomi_books
{
    size_t source_id;    // Manga site id by tachiyomi
    char *source_name;   // Manga site name
    char *title;         // (cannot be null, but can be empty)
    char *alt_title;     // (can be null as well?)
    char *artist;        // (can be null)
    char *author;        // (can be null)
    char *description;   // (can be null)
    char **genre;        // Can be an empty list? So (can be null)
    size_t status;       // Maybe this is (completed, ongoing, hiatus, etc...)
    char *thumbnail_url; // Doesn't seem like it's needed for convertion (Mark
                         // my words here, I may be wrong)
    size_t date_added;   // Maybe this uses the unix time?
    size_t viewer_flags; // Now I seriously do not know what this is
    size_t flags;        // Even this that they said wasn't used
                         // in v 0.x and I dunno what this is
};

typedef struct __darr_for_ptr T_Book_List;
typedef struct __tachiyomi_books Tachiyomi_Books;
typedef struct __tachiyomi_books *T_Book_Ptr;

void tachiyomi_data_parse(char **input_data, T_Book_List *books);
void tachiyomi_books_print(T_Book_List *books);

#endif
