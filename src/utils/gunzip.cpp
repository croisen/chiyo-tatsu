#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "zconf.h"
#include "zlib.h"

#include "col_lim_fprintf.hpp"
#include "gunzip.hpp"

#define CHUNK      131072
#define WINDOWBITS 16

namespace zlib
{
int64_t gunzip(std::string filename, std::vector<uint8_t> *buffer)
{
    buffer->clear();
    std::vector<uint8_t> compressedBuffer;
    FILE *compressedFp = std::fopen(filename.c_str(), "rb");
    if (compressedFp == NULL) {
        chiyotatsuLog(CHFAIL, "Failed to open file %s\n", filename.c_str());
        return -1;
    }

    int64_t ret        = 0;
    uint64_t have      = 0;
    uint8_t in[CHUNK]  = {0};
    uint8_t out[CHUNK] = {0};
    z_stream strm;
    memset(&strm, 0, sizeof(z_stream));

    if (inflateInit2(&strm, (WINDOWBITS + MAX_WBITS)) != Z_OK) {
        chiyotatsuLog(
            CHFAIL, "Failed to decompress file %s\n", filename.c_str()
        );
        inflateEnd(&strm);
        return -1;
    }

    do {
        strm.avail_in = fread(in, 1, CHUNK, compressedFp);
        if (ferror(compressedFp)) {
            (void)inflateEnd(&strm);
            fclose(compressedFp);
            chiyotatsuLog(
                CHFAIL, "Error in decompressing file %s\n", filename.c_str()
            );
            return -1;
        }

        if (strm.avail_in == 0) {
            break;
        }

        strm.next_in = in;
        do {
            strm.avail_out = CHUNK;
            strm.next_out  = out;

            ret            = inflate(&strm, Z_NO_FLUSH);
            if (ret == Z_STREAM_ERROR) {
                (void)inflateEnd(&strm);
                fclose(compressedFp);
                chiyotatsuLog(
                    CHFAIL, "Error in decompressing file %s\n", filename.c_str()
                );
                return -1;
            }

            switch (ret) {
            case Z_NEED_DICT:
                ret = Z_DATA_ERROR; /* fallthrough */
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
                (void)inflateEnd(&strm);
                fclose(compressedFp);
                chiyotatsuLog(
                    CHFAIL, "Error in decompressing file %s\n", filename.c_str()
                );
                return -1;
            }

            have = CHUNK - strm.avail_out;
            for (uint64_t i = 0; i < have; i += 1)
                buffer->push_back(out[i]);
        } while (strm.avail_out == 0);
    } while (ret != Z_STREAM_END);

    uint64_t decompressedSize = strm.total_out;
    inflateEnd(&strm);
    fclose(compressedFp);

    return decompressedSize;
}
} // namespace zlib
