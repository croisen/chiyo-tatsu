#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>

#include <zconf.h>
#include <zlib.h>

#include "bread_parser_pair.h"
#include "chiyotatsu_util.hpp"
#include "col_lim_fprintf.hpp"
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

string getReference(void)
{
    char *referenceArg = (char *)bParserGetArg('r', NULL, 0);
    string reference = (referenceArg == NULL) ? string() : string(referenceArg);
    if (referenceArg == NULL)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "No output passed into -r or --reference\n"
        );
    else if (reference.length() == 0)
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL,
            "Backup file passed into -r or --reference is not proper\n",
        );

    return reference;
}
} // namespace chiyotatsu
