#include <cinttypes>
#include <cstdint>
#include <string>

#include "utils/chiyotatsu_util.hpp"
#include "utils/col_lim_fprintf.hpp"
#include "utils/kotatsu_utils.hpp"
#include "utils/tachiyomi_utils.hpp"

using namespace std;
int main(int argc, char **argv)
{
    chiyotatsu::registerShutdownHook();
    chiyotatsu::defineArgs(argc, argv);
    string input     = chiyotatsu::getInput();
    string output    = chiyotatsu::getOutput();
    string reference = chiyotatsu::getReference();

    Backup tachiyomi = tachiyomi::parseTachiyomiFile(input);
    chiyotatsuLog(
        CHINFO, "Book(?) Count %" PRIu64 "\n",
        (uint64_t)tachiyomi.mangabackup().size()
    );
    chiyotatsuLog(
        CHINFO, "Source Count: %" PRIu64 "\n",
        (uint64_t)tachiyomi.sources().size()
    );

    kotatsu::readReference(reference);
    return 0;
}
