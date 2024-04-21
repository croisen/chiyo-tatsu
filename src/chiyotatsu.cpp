#include <cstdint>

#include "utils/args.hpp"
#include "utils/bread_parser.h"
#include "utils/col_lim_fprintf.h"
#include "utils/gunzip.hpp"
#include "utils/shutdown_hooks.hpp"

#include "compiled_proto/tachiyomi.pb.h"

int main(int argc, char **argv)
{
    defineArgs(argc, argv);
    char *input = (char *)bParserGetArg('i', NULL, 0);
    if (input == NULL) {
        chiyotatsuLog(
            CHFAIL, "No input set via the -i or --input flag, please set a "
                    "tachiyomi backup file as input this way\n"
        );
        bParserPrintHelp();
        std::exit(EXIT_FAILURE);
    }
    chiyotatsuLog(CHINFO, "Input File: %s\n", input);

    std::vector<uint8_t> inputDecompressed = std::vector<uint8_t>();
    int64_t size                           = gunzip(input, &inputDecompressed);
    chiyotatsuLog(CHINFO, "Decompressed Size: %" PRId64 "\n", size);

    Backup tachiyomiBackup;
    tachiyomiBackup.ParseFromArray(inputDecompressed.data(), size);

    for (auto manga : tachiyomiBackup.mangabackup())
        chiyotatsuFprintf(80, stdout, "Manga: %s\n", manga.title().c_str());

    for (auto category : tachiyomiBackup.categories())
        chiyotatsuFprintf(
            80, stdout, "Category: %s\n", category.name().c_str()
        );

    shutdownChiyotatsu();
    return 0;
}
