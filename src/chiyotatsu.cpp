#include <cstdint>
#include <string>

#include "utils/args.hpp"
#include "utils/bread_parser.h"
#include "utils/col_lim_fprintf.hpp"
#include "utils/gunzip.hpp"
#include "utils/shutdown_hooks.hpp"

#include "compiled_proto/tachiyomi.pb.h"
#include "utils/tachiyomi_source_ids.hpp"

int main(int argc, char **argv)
{
    chiyotatsu::defineArgs(argc, argv);
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
    int64_t size = zlib::gunzip(input, &inputDecompressed);
    chiyotatsuLog(CHINFO, "Decompressed Size: %" PRId64 "\n", size);

    Backup tachiyomiBackup;
    tachiyomiBackup.ParseFromArray(inputDecompressed.data(), size);
    std::set<uint64_t> sourceIDs      = std::set<uint64_t>();
    std::set<std::string> sourceNames = std::set<std::string>();

    for (auto manga : tachiyomiBackup.mangabackup()) {
        chiyotatsuFprintf(
            80, stdout, "Source: %20" PRIu64 " Manga: %s\n", manga.source(),
            manga.title().c_str()
        );
        sourceIDs.insert(manga.source());
        if (tachiyomi::SourceIDs.find(manga.source()) !=
            tachiyomi::SourceIDs.end())
            sourceNames.insert(tachiyomi::SourceIDs.at(manga.source()));
        else
            chiyotatsuLog(
                CHWARN, "Source ID %" PRIu64 " not found!\n", manga.source()
            );
    }

    for (auto category : tachiyomiBackup.categories())
        chiyotatsuFprintf(
            80, stdout, "Category: %s\n", category.name().c_str()
        );

    auto it1 = sourceIDs.begin();
    auto it2 = sourceNames.begin();
    for (; it1 != sourceIDs.end() && it2 != sourceNames.end(); it1++, it2++)
        chiyotatsuFprintf(
            80, stdout, "Source ID: %20" PRIu64 " Name: %s\n", *it1,
            (*it2).c_str()
        );

    chiyotatsu::shutdown();
    return 0;
}
