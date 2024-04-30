#include <cstdint>
#include <iostream>
#include <string>

#include "utils/args.hpp"
#include "utils/chiyotatsu-util.hpp"
#include "utils/tachiyomi_source_ids.hpp"

int main(int argc, char **argv)
{
    chiyotatsu::defineArgs(argc, argv);
    std::set<std::string> sources;
    std::string input  = chiyotatsu::getInput();
    std::string output = chiyotatsu::getOutput();

    Backup tachiyomi   = chiyotatsu::parseTachiyomiFile(input);

    for (auto manga : tachiyomi.mangabackup()) {
        std::cout << manga.title() << std::endl;
        int64_t sourceId = manga.source();
        sources.insert(tachiyomi::SourceIDs.at(sourceId));
    }

    std::cout << std::endl << "Sources:" << std::endl;
    for (auto source : sources)
        std::cout << source << std::endl;

    return 0;
}
