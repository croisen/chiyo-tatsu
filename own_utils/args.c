#include <stdlib.h>

#include "args.h"
#include "bread_parser.h"

void defineArgs(void)
{
    bParserSetProgramName("chiyotatsu");
    bParserSetProgramVersion("3.0.1");
    bParserSetAuthorName("croisen");
    bParserSetAuthorEmail("andrewjames.git.gan@gmail.com");

    bParserAddOpts('i', "input", 1);
    bParserAddDesc('i', NULL, "Pass in the tachiyomi backup file");
    bParserAddArgs('i', NULL, 1, STRBP);

    bParserAddOpts('o', "output", 1);
    bParserAddDesc(
        'o', NULL, "Set the filename of the output kotatsu backup file"
    );
    bParserAddArgs('o', NULL, 1, STRBP);
}
