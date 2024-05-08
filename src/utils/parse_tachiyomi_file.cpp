#include <cstdint>
#include <cstdlib>
#include <string>
#include <vector>

#include "zconf.h"
#include "zlib.h"

#include "../compiled_proto/tachiyomi.pb.h"
#include "col_lim_fprintf.hpp"

#define CHUNK      262144
#define WINDOWBITS 16

using namespace std;
using namespace google::protobuf::io;

void gunzip(const string &filename, vector<uint8_t> &outBuffer)
{
    vector<uint8_t> compressedBuffer;
    FILE *compressedFp = fopen(filename.c_str(), "rb");
    if (compressedFp == NULL)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "Failed to open file %s\n", filename.c_str()
        );

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
        return;
    }

    do {
        strm.avail_in = fread(in, 1, CHUNK, compressedFp);
        if (ferror(compressedFp)) {
            (void)inflateEnd(&strm);
            fclose(compressedFp);
            chiyotatsuPanic(
                EXIT_FAILURE, CHFAIL, "Error in decompressing file %s\n",
                filename.c_str()
            );
        }

        if (strm.avail_in == 0)
            break;

        strm.next_in = in;
        do {
            strm.avail_out = CHUNK;
            strm.next_out  = out;

            ret            = inflate(&strm, Z_NO_FLUSH);
            if (ret == Z_STREAM_ERROR) {
                (void)inflateEnd(&strm);
                fclose(compressedFp);
                chiyotatsuPanic(
                    EXIT_FAILURE, CHFAIL, "Error in decompressing file %s\n",
                    filename.c_str()
                );
            }

            switch (ret) {
            case Z_NEED_DICT:
                ret = Z_DATA_ERROR; /* fallthrough */
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
                (void)inflateEnd(&strm);
                fclose(compressedFp);
                chiyotatsuPanic(
                    EXIT_FAILURE, CHFAIL, "Error in decompressing file %s\n",
                    filename.c_str()
                );
            }

            have = CHUNK - strm.avail_out;
            for (uint64_t i = 0; i < have; i += 1)
                outBuffer.push_back(out[i]);
        } while (strm.avail_out == 0);
    } while (ret != Z_STREAM_END);

    inflateEnd(&strm);
    fclose(compressedFp);
}

namespace tachiyomi
{
Backup parseTachiyomiFile(string &input)
{
    Backup tachiyomiBackup;
    vector<uint8_t> tBuffer;
    gunzip(input, tBuffer);
    tachiyomiBackup.ParseFromArray(tBuffer.data(), tBuffer.size());
    return tachiyomiBackup;
}
} // namespace tachiyomi
