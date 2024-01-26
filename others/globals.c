#include <stdio.h>

#include "globals.h"

extern FILE *input;
extern FILE *output;

void chiyo_tatsu_file_close_io()
{

    if (input != NULL)
    {
        fclose(input);
    }

    if (output != NULL)
    {
        fclose(output);
    }
}
