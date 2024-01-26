#include <stdio.h>

#include "others/args.h"
#include "others/globals.h"

#define CROI_LIB_BREAD_PARSER_IMPL_H
#include "others/bread_parser.h"

FILE *input  = NULL;
FILE *output = NULL;

int main(int argc, char **argv)
{
    atexit(chiyo_tatsu_file_close_io);

    define_args();
    bread_parse(argc, argv);

    if (bread_parser_is_opt_used('i'))
    {
        input = fopen((char *)bread_parser_get_arg('i', 0), "rb");
        printf("File %s is the tachiyomi backup input\n",
               (char *)bread_parser_get_arg('i', 0));
    }

    if (bread_parser_is_opt_used('o'))
    {
        output = fopen((char *)bread_parser_get_arg('o', 0), "wb");
        printf("File %s is the kotatsu backup output\n",
               (char *)bread_parser_get_arg('o', 0));
    }

    printf("Input: %p, Output: %p\n", (void *)input, (void *)output);

    return 0;
}
