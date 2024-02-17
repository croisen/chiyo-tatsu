#include "args.h"
#include "bread_parser.h"

void define_args(void)
{
    bread_parser_set_program_name("Chiyo-Tatsu");
    bread_parser_set_author_name("Croisen");
    bread_parser_set_author_email("andrewjames.git.gan@gmail.com");

    bread_parser_add_option('i', "input", 1);
    bread_parser_add_descrp('i', "Set a file as input");
    bread_parser_opt_argmts('i', 1, BREAD_CHAR);

    bread_parser_add_option('r', "reference", 1);
    bread_parser_add_descrp('r',
                            "I need a reference file to the current kotatsu "
                            "backup (must be another kotatsu backup file)");
    bread_parser_opt_argmts('r', 1, BREAD_CHAR);

    bread_parser_add_option('o', "output", 1);
    bread_parser_add_descrp('o', "Set a file as output (is optional)");
    bread_parser_opt_argmts('o', 1, BREAD_CHAR);
}
