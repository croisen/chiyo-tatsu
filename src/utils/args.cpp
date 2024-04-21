#include "args.hpp"
#include "bread_parser.h"

void defineArgs(int argc, char **argv)
{
    bParserSetProgramName((char *)"chiyotatsu");
    bParserSetProgramVersion((char *)"v0.1.1");
    bParserSetAuthorName((char *)"croisen");
    bParserSetAuthorEmail((char *)"andrewjames.git.gan@gmail.com");

    bParserAddOpts('i', "input", 1);
    bParserAddDesc('i', NULL, "Provide an input file as the tachiyomi backup");
    bParserAddArgs('i', NULL, 1, STRBP);

    bParserParse(argc, argv);
}
