#ifndef __CHIYOTATSU_COLUMN_LIMITED_FPRINTF__
#define __CHIYOTATSU_COLUMN_LIMITED_FPRINTF__

#ifdef __cplusplus
extern "C" {
#endif

#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define CHINFO "[INFO]     "
#define CHWARN "[WARN]     "
#define CHFAIL "[ERROR]    " // This don't seem correct but I'mma go with it
#define CHCRIT "[CRITICAL] "

#define chiyotatsuFprintf(columnWidth, stream, fmt, ...)                       \
    do {                                                                       \
        int printLen = columnWidth;                                            \
        uint64_t neededSize =                                                  \
            snprintf(NULL, 0, fmt __VA_OPT__(, ) __VA_ARGS__) + 1;             \
        char *_CL_printBuf = (char *)malloc(neededSize * sizeof(char));        \
        if (_CL_printBuf == NULL) {                                            \
            fprintf(stream, "Cannot initialize columned fprintf\n");           \
            fprintf(stream, fmt __VA_OPT__(, ) __VA_ARGS__);                   \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
                                                                               \
        sprintf(_CL_printBuf, fmt __VA_OPT__(, ) __VA_ARGS__);                 \
        uint64_t _CL_printBufLen =                                             \
            (_CL_printBuf == NULL) ? 0 : strlen(_CL_printBuf);                 \
        char *_CL_copy = _CL_printBuf;                                         \
        while ((_CL_printBuf + _CL_printBufLen) >= _CL_copy) {                 \
            int wordLen = strcspn(_CL_copy, " ");                              \
            if (wordLen > printLen) {                                          \
                printf("\n");                                                  \
                printLen = columnWidth;                                        \
            }                                                                  \
                                                                               \
            if (_CL_copy[wordLen - 1] == '\n') {                               \
                printf("%.*s", wordLen, _CL_copy);                             \
                printLen  = columnWidth;                                       \
                _CL_copy += wordLen;                                           \
                _CL_copy += strcspn(_CL_copy, " ") + 1;                        \
            } else {                                                           \
                printf("%.*s ", wordLen, _CL_copy);                            \
                _CL_copy += wordLen;                                           \
                _CL_copy += strcspn(_CL_copy, " ") + 1;                        \
                printLen -= wordLen + 1;                                       \
            }                                                                  \
        }                                                                      \
        free(_CL_printBuf);                                                    \
    } while (false)

#define chiyotatsuLog(msgPrefix, fmtMessage, ...)                              \
    chiyotatsuFprintf(                                                         \
        80, stdout, msgPrefix fmtMessage __VA_OPT__(, ) __VA_ARGS__            \
    )

#define chiyotatsuPanic(exitCode, msgPrefix, fmtMessage, ...)                  \
    do {                                                                       \
        chiyotatsuFprintf(                                                     \
            80, stdout, msgPrefix fmtMessage __VA_OPT__(, ) __VA_ARGS__        \
        );                                                                     \
        exit(exitCode);                                                        \
    } while (false)

#ifdef __cplusplus
}
#endif

#endif // __CHIYOTATSU_COLUMN_LIMITED_FPRINTF__
