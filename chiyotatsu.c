#include <inttypes.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "own_utils/args.h"
#include "own_utils/tachiyomi_gzip.h"

#define ___0001_CROI_C_RANDOM_HEADER_CODE_IMPL___
#include "own_utils/memtracker.h"

#define __CROI_BREAD_PARSER_IMPL__
#include "own_utils/bread_parser.h"

int main(int argc, char **argv)
{
    defineArgs();
    bParserParse(argc, argv);

    char *inputFile = bParserGetArg('i', NULL, 0);
    if (inputFile == NULL) {
        memTrackerLog(
            BPFAIL, "%s is expecting a tachiyomi backup file inputted via -i\n",
            programName
        );
        bParserPrintHelp();
        exit(EXIT_FAILURE);
    }

    uint8_t *tachiyomiProto     = NULL;
    uint64_t tachiyomiProtoSize = tachiyomiGzipLoad(inputFile, &tachiyomiProto);
    printf("Decoded Size: %" PRIu64 "\n", tachiyomiProtoSize);
    return 0;
}
