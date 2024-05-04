#ifndef __CHIYOTATSU_UTIL__
#define __CHIYOTATSU_UTIL__

#include <string>

#include "../compiled_proto/tachiyomi.pb.h"
#include "kotatsu_utils.hpp"

namespace chiyotatsu
{
void defineArgs(int argc, char **argv);
void registerShutdownHook(void);
void shutdown(void);

std::string getInput(void);
std::string getOutput(void);
std::string getReference(void);
Backup parseTachiyomiFile(std::string input);
kotatsu::KotatsuBackup *
chiyototatsu(Backup *tachiyomiBackup, kotatsu::KotatsuBackup *reference);
} // namespace chiyotatsu

#endif // __CHIYOTATSU_UTIL__
