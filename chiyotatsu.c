#include <inttypes.h>

#include <stdint.h>
#include <stdio.h>

#include "own_utils/args.h"
#include "own_utils/protobuf_parser.h"
#include "own_utils/tachiyomi_gzip.h"

#define CROI_LIB_BREAD_PARSER_IMPL_H
#include "own_utils/bread_parser.h"

static volatile int run = 1;

int main(int argc, char **argv)
{

    define_args();
    bread_parse(argc, argv);

    if (!bread_parser_is_opt_used('i'))
    {
        fprintf(stderr, "Expecting an input file via the -i flag\n");
        bread_print_help(1, argv);
    }

    if (bread_parser_is_opt_used('o'))
    {
        __bread_panic("Output not implemented yet\n");
    }

    uint8_t *input_buf          = NULL;
    PB_ProtoBuf_Struct *out_buf = NULL;
    /*uint8_t **output_buf = __bread_calloc(1, sizeof(uint8_t *));*/

    char *file_input            = bread_parser_get_arg('i', 0);
    printf("Trying to decompress %s\n", file_input);
    uint64_t i = tachiyomi_gzip_load(file_input, &input_buf);

    printf("Decompressed size: %" PRIu64 "\n", i);
    decode_unknown_protobuf(input_buf, i, &out_buf);

    return 0;
}
