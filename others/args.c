#include "args.h"
#include "bread_parser.h"

void define_args()
{
    bread_parser_add_option('i', "input", 1);
    bread_parser_add_descrp('i', "Set a file as input");
    bread_parser_opt_argmts('i', 1, BREAD_CHAR);

    bread_parser_add_option('o', "output", 1);
    bread_parser_add_descrp('o', "Set a file as output");
    bread_parser_opt_argmts('o', 1, BREAD_CHAR);
}
