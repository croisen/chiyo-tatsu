#include <signal.h>

#include <stdio.h>
#include <unistd.h>

#include "own_utils/args.h"
#include "own_utils/tachiyomi_gzip.h"

#define CROI_LIB_BREAD_PARSER_IMPL_H
#include "own_utils/bread_parser.h"

static volatile int run = 1;

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
        char *file_input = bread_parser_get_arg('i', 0);
        printf("Trying to decompress %s\n", file_input);
        size_t i = tachiyomi_gzip_load(file_input, input_uncompressed) *
                   sizeof(unsigned char);
        /*write(STDOUT_FILENO, *input_uncompressed, i);*/
        printf("Size: %lu\n", i);
    }

    if (bread_parser_is_opt_used('o'))
    {
        __bread_panic("Output not implemented yet");
        (void)output_compressed;
        /*kotatsu_zip_load(output, bread_parser_get_arg('o', 0));*/
    }

    return 0;
}
