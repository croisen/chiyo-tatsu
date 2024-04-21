#ifndef __CROI_BREAD_PARSER_H__
#define __CROI_BREAD_PARSER_H__

/*
 * After creating an app for my shs with dart
 * I may have gotten addicted to camelCase...
 * May I use it correctly...
 */

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define BParserMaxLineWidth 80
#define BParserNoShortOpt   -127

enum BParserArgType {
    I32BP,
    I64BP,
    U32BP,
    U64BP,
    STRBP,
    ANYBP,
};

void bParserSetProgramName(char *name);
void bParserSetProgramVersion(char *version);
void bParserSetAuthorName(char *name);
void bParserSetAuthorEmail(char *email);

/*
 * Sets an opt like -v and --verbose, the group specifies in which order it
 * is shown in the automatically generated help command
 */
void bParserAddOpts(const char shortOpt, const char *longOpt, int64_t group);

// Sets the description written in the help command
void bParserAddDesc(
    const char shortOpt, const char *longOpt, const char *description
);

/*
 * Sets the arguments to be accepted by the option specified by add opt
 * Set argCount to 0 and only specify one argType to make an opt accept an
 * indefinite number of one argType
 * (Sad that documentation on macros don't show yet on macros as of April 8,
 * 2024)
 */
#define bParserAddArgs(shortOpt, longOpt, argCount, argTypes, ...)             \
    __bParserAddArgs(                                                          \
        shortOpt, longOpt, argCount, argTypes __VA_OPT__(, ) __VA_ARGS__, NULL \
    )

void __bParserAddArgs(
    const char shortOpt, const char *longOpt, uint64_t argCount, ...
);

/*
 * Start parsing the opts (must be used after defining the opts)
 */
void bParserParse(int argc, char **argv);
void bParserPrintHelp(void);
bool bParserWasOptUsed(const char shortOpt, const char *longOpt);
void **bParserGetArgs(const char shortOpt, const char *longOpt);
void *bParserGetArg(const char shortOpt, const char *longOpt, uint64_t index);

#define BPINFO "[INFO]     "
#define BPWARN "[WARN]     "
#define BPFAIL "[ERROR]    " // This don't seem correct but I'mma go with it
#define BPCRIT "[CRITICAL] "

// I feel like this is gonna cause some bugs later but eh
#define bParserLog(msgPrefix, fmtMessage, ...)                                 \
    do {                                                                       \
        int printLen = BParserMaxLineWidth;                                    \
        uint64_t neededSize =                                                  \
            (uint64_t)snprintf(                                                \
                NULL, 0, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage,      \
                __FILE__, (uint64_t)__LINE__ __VA_OPT__(, ) __VA_ARGS__        \
            ) +                                                                \
            1;                                                                 \
        char *theLog = (char *)calloc(neededSize, sizeof(char));               \
        sprintf(                                                               \
            theLog, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage, __FILE__, \
            (uint64_t)__LINE__ __VA_OPT__(, ) __VA_ARGS__                      \
        );                                                                     \
                                                                               \
        char *copy         = theLog;                                           \
        uint64_t theLogLen = strlen(theLog);                                   \
        while ((theLog + theLogLen) >= copy) {                                 \
            int wordLen = (int)strcspn(copy, " ");                             \
            if (wordLen > printLen) {                                          \
                printf("\n");                                                  \
                printLen = BParserMaxLineWidth;                                \
            }                                                                  \
                                                                               \
            if ((theLog + strlen(theLog)) == (copy + wordLen))                 \
                printf("%.*s", wordLen, copy);                                 \
            else                                                               \
                printf("%.*s ", wordLen, copy);                                \
                                                                               \
            copy     += wordLen;                                               \
            copy     += strcspn(copy, " ") + 1;                                \
            printLen -= wordLen + 1;                                           \
        }                                                                      \
        free(theLog);                                                          \
    } while (false)

#define bParserPanic(exitCode, msgPrefix, fmtMessage, ...)                     \
    do {                                                                       \
        int printLen = BParserMaxLineWidth;                                    \
        uint64_t neededSize =                                                  \
            (uint64_t)snprintf(                                                \
                NULL, 0, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage,      \
                __FILE__, (uint64_t)__LINE__ __VA_OPT__(, ) __VA_ARGS__        \
            ) +                                                                \
            1;                                                                 \
        char *theLog       = (char *)calloc(neededSize, sizeof(char));         \
        uint64_t theLogLen = strlen(theLog);                                   \
        sprintf(                                                               \
            theLog, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage, __FILE__, \
            (uint64_t)__LINE__ __VA_OPT__(, ) __VA_ARGS__                      \
        );                                                                     \
                                                                               \
        char *copy = theLog;                                                   \
        while ((theLog + theLogLen) >= copy) {                                 \
            int wordLen = (int)strcspn(copy, " ");                             \
            if (wordLen > printLen) {                                          \
                printf("\n");                                                  \
                printLen = BParserMaxLineWidth;                                \
            }                                                                  \
                                                                               \
            if ((theLog + strlen(theLog)) == (copy + wordLen))                 \
                printf("%.*s", wordLen, copy);                                 \
            else                                                               \
                printf("%.*s ", wordLen, copy);                                \
                                                                               \
            copy     += wordLen;                                               \
            copy     += strcspn(copy, " ") + 1;                                \
            printLen -= wordLen + 1;                                           \
        }                                                                      \
        free(theLog);                                                          \
        exit(exitCode);                                                        \
    } while (false)

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // __CROI_BREAD_PARSER_H__
