#ifndef __CHIYOTATSU_UTIL__
#define __CHIYOTATSU_UTIL__

#include <string>

#include "../compiled_proto/tachiyomi.pb.h"

namespace chiyotatsu
{
void defineArgs(int argc, char **argv);
void registerShutdownHook(void);
void shutdown(void);

std::string getInput(void);
std::string getOutput(void);
Backup parseTachiyomiFile(std::string input);
} // namespace chiyotatsu

#endif // __CHIYOTATSU_UTIL__
