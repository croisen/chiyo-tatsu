#include <inttypes.h>

#include <stdio.h>
#include <unistd.h>

#include "own_utils/args.h"
#include "own_utils/tachiyomi.pb-c.h"
#include "own_utils/tachiyomi_gzip.h"
#include "own_utils/tachiyomi_parse.h"

#define CROI_LIB_BREAD_PARSER_IMPL_H
#include "own_utils/bread_parser.h"

static volatile int run = 1;

int main(int argc, char **argv)
{
    unsigned char **input_uncompressed =
        __bread_calloc(1, sizeof(unsigned char *));
    unsigned char **output_compressed =
        __bread_calloc(1, sizeof(unsigned char *));
    BackupManga *tachiyomi_books = NULL;

    define_args();
    bread_parse(argc, argv);

    if (bread_parser_is_opt_used('i'))
    {
        char *file_input = bread_parser_get_arg('i', 0);
        printf("Trying to decompress %s\n", file_input);
        uint64_t i = tachiyomi_gzip_load(file_input, input_uncompressed) *
                     sizeof(unsigned char);
        printf("Decompressed size: %" PRIu64 "\n", i);
        tachiyomi_books = deserialize_protobuf(*input_uncompressed, i);
        if (tachiyomi_books == NULL)
        {
            __bread_panic("Failed to serialize tachiyomi_books\n");
        }

        printf("%s\n", tachiyomi_books->title);

        backup_manga__free_unpacked(tachiyomi_books, NULL);
    }

    if (bread_parser_is_opt_used('o'))
    {
        __bread_panic("Output not implemented yet");
        (void)output_compressed;
        /*kotatsu_zip_load(output, bread_parser_get_arg('o', 0));*/
    }

    return 0;
}
