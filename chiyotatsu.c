#include "others/args.h"
#include "others/globals.h"
#include "others/tachiyomi_gzip.h"

#define CROI_LIB_BREAD_PARSER_IMPL_H
#include "others/bread_parser.h"

int main(int argc, char **argv)
{
    define_args();
    bread_parse(argc, argv);

    unsigned char **input_uncompressed =
        __bread_calloc(1, sizeof(unsigned char *));
    unsigned char **output_compressed =
        __bread_calloc(1, sizeof(unsigned char *));

    if (bread_parser_is_opt_used('i'))
    {
        tachiyomi_gzip_load(bread_parser_get_arg('i', 0), input_uncompressed);
    }

    if (bread_parser_is_opt_used('o'))
    {
        __bread_panic("Output not implemented yet");
        (void)output_compressed;
        /*kotatsu_zip_load(output, bread_parser_get_arg('o', 0));*/
    }

    return 0;
}
