#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <string>

#include <vector>
#include <zconf.h>
#include <zlib.h>

#include "bread_parser.h"
#include "chiyotatsu-util.hpp"
#include "col_lim_fprintf.hpp"
#include "shutdown_hooks.hpp"

#include "../compiled_proto/tachiyomi.pb.h"

#define CHUNK      262144
#define WINDOWBITS 16

using namespace std;

namespace chiyotatsu
{
void registerShutdownHook(void)
{
    atexit(chiyotatsu::shutdown);
}

string getInput(void)
{
    char *inputArg = (char *)bParserGetArg('i', NULL, 0);
    string input   = (inputArg == NULL) ? string() : string(inputArg);
    if (inputArg == NULL)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "No input passed into -i or --input\n",
        );
    else if (input.length() == 0)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL,
            "Backup file passed into -i or --input is not proper\n",
        );

    return input;
}

string getOutput(void)
{
    char *outputArg = (char *)bParserGetArg('o', NULL, 0);
    string output   = (outputArg == NULL) ? string() : string(outputArg);
    if (outputArg == NULL)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "No output passed into -o or --output\n"
        );
    else if (output.length() == 0)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL,
            "Backup file passed into -o or --output is not proper\n",
        );

    return output;
}

Backup parseTachiyomiFile(string input)
{
    Backup tachiyomiBackup;
    vector tData        = vector<uint8_t>();
    FILE *tachiyomiFile = fopen(input.c_str(), "rb");
    if (tachiyomiFile == NULL)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "Cannot open file %s\n", input.c_str()
        );

    uint64_t have = 0;
    uint8_t in[CHUNK];
    uint8_t out[CHUNK];
    z_stream strm;
    memset(in, 0, CHUNK);
    memset(out, 0, CHUNK);
    memset(&strm, 0, sizeof(z_stream));

    if (inflateInit2(&strm, WINDOWBITS + MAX_WBITS) != Z_OK) {
        fclose(tachiyomiFile);
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "Cannot decompress file %s\n", input.c_str()
        );
    }

    do {
        strm.avail_in = fread(in, 1, CHUNK, tachiyomiFile);
        if (ferror(tachiyomiFile)) {
            inflateEnd(&strm);
            fclose(tachiyomiFile);
            chiyotatsuPanic(
                EXIT_FAILURE, CHFAIL,
                "File reading error occured for file: %s\n", input.c_str()
            );
        }
        if (strm.avail_in == 0)
            break;

        strm.next_in = in;
        do {
            strm.avail_out = CHUNK;
            strm.next_out  = out;
            int ret        = inflate(&strm, Z_NO_FLUSH);
            if (ret == Z_STREAM_ERROR) {
                inflateEnd(&strm);
                fclose(tachiyomiFile);
                chiyotatsuPanic(
                    EXIT_FAILURE, CHFAIL,
                    "File reading inflation occured for file: %s\n",
                    input.c_str()
                );
            }

            switch (ret) {
            case Z_NEED_DICT:
                ret = Z_DATA_ERROR; // FALLTHROUGH
            case Z_DATA_ERROR:      // FALLTHROUGH
            case Z_MEM_ERROR:
                inflateEnd(&strm);
                fclose(tachiyomiFile);
                chiyotatsuPanic(
                    EXIT_FAILURE, CHFAIL,
                    "File reading inflation occured for file: %s\n",
                    input.c_str()
                );
            }

            have = CHUNK - strm.avail_out;
            for (uint64_t i = 0; i < have; i += 1)
                tData.push_back(out[i]);
        } while (strm.avail_out == 0);
    } while (strm.avail_in > 0);

    inflateEnd(&strm);
    fclose(tachiyomiFile);
    tachiyomiBackup.ParseFromArray(tData.data(), tData.size());
    return tachiyomiBackup;
}
} // namespace chiyotatsu
