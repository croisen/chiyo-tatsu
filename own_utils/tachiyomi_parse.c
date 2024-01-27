#include <inttypes.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "bread_parser.h"
#include "tachiyomi_parse.h"

/*struct __tachiyomi_books*/
/*{*/
/*size_t source_id;    // Manga site id by tachiyomi*/
/*char *source_name;   // Manga site name*/
/*char *title;         // (cannot be null, but can be empty)*/
/*char *alt_title;     // (can be null as well?)*/
/*char *artist;        // (can be null)*/
/*char *author;        // (can be null)*/
/*char *description;   // (can be null)*/
/*char **genre;        // Can be an empty list? So (can be null)*/
/*size_t status;       // Maybe this is (completed, ongoing, hiatus, etc...)*/
/*char *thumbnail_url; // Doesn't seem like it's needed for convertion (Mark*/
/*// my words here, I may be wrong)*/
/*size_t date_added;   // Maybe this uses the unix time?*/
/*size_t viewer_flags; // Now I seriously do not know what this is*/
/*size_t flags;        // Even this that they said wasn't used*/
/*// in v 0.x and I dunno what this is*/
/*};*/

size_t get_len_of_proto_buf(char *input)
{
    (void)input;
    return 0;
}

void tachiyomi_data_parse(char **input_data, T_Book_List *books)
{
    (void)input_data, (void)books;
}

void tachiyomi_books_print(T_Book_List *books)
{
    (void)books;
}
