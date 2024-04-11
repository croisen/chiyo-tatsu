#include <inttypes.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "own_utils/args.h"
#include "own_utils/tachiyomi_gzip.h"
#include "proto_files/c_stuff/backup_manga.pb-c.h"
#include "proto_files/c_stuff/tachiyomi.pb-c.h"

#define ___0001_CROI_C_RANDOM_HEADER_CODE_IMPL___
#define ___0001_5_CROI_C_RANDOM_HEADER_CODE_IMPL___
#include "own_utils/memtracker_extended.h"

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
    Backup *tachiyomiBackup =
        backup__unpack(&customAllocator, tachiyomiProtoSize, tachiyomiProto);
    if (tachiyomiBackup == NULL)
        memTrackerPanic(
            EXIT_FAILURE, MTFAIL,
            "Failed to parse the tachiyomi backup protobuf\n"
        );

    printf(
        "Decoded Size: %11" PRIu64 " Manga Count: %5" PRIu64 "\n",
        tachiyomiProtoSize, (uint64_t)tachiyomiBackup->n_mangabackup
    );
    for (uint64_t i = 0; i < tachiyomiBackup->n_mangabackup; i += 1) {
        BackupManga *manga = tachiyomiBackup->mangabackup[i];
        printf("Manga Name: %s\n", manga->title);
    }
    return 0;
}
