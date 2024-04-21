#ifndef ___CHIYOTATSU_GUNZIP__
#define ___CHIYOTATSU_GUNZIP__

#include <cstdint>
#include <string>
#include <vector>

int64_t gunzip(std::string fileName, std::vector<uint8_t> *buffer);

#endif // ___CHIYOTATSU_GUNZIP__
