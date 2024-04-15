#ifndef ___0001_CROI_C_RANDOM_HEADER_CODE___
#define ___0001_CROI_C_RANDOM_HEADER_CODE___

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void mTFree(void *ptr);
void *mTMalloc(uint64_t size);
void *mTCalloc(uint64_t nmemb, uint64_t size);
void *mTRealloc(void *ptr, uint64_t size);

void memTrackerInit(void);
void memTrackerFree(void);
void memTrackerFreeSignal(int sig);
void memTrackerExpand(void);

#define MTMaxLineWidth 80
#define MTINFO         "[INFO]     "
#define MTWARN         "[WARN]     "
#define MTFAIL         "[ERROR]    " // This don't seem correct but I'mma go with it
#define MTCRIT         "[CRITICAL] "

// I feel like this is gonna cause some bugs later but eh
#define memTrackerLog(msgPrefix, fmtMessage, ...)                              \
    do {                                                                       \
        int printLen = MTMaxLineWidth;                                         \
        uint64_t neededSize =                                                  \
            (uint64_t)snprintf(                                                \
                NULL, 0, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage,      \
                __FILE__, (uint64_t)__LINE__, ##__VA_ARGS__                    \
            ) +                                                                \
            1;                                                                 \
        char *theLog = calloc(neededSize, sizeof(char));                       \
        sprintf(                                                               \
            theLog, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage, __FILE__, \
            (uint64_t)__LINE__, ##__VA_ARGS__                                  \
        );                                                                     \
                                                                               \
        char *copy         = theLog;                                           \
        uint64_t theLogLen = strlen(theLog);                                   \
        while ((theLog + theLogLen) >= copy) {                                 \
            int wordLen = (int)strcspn(copy, " ");                             \
            if (wordLen > printLen) {                                          \
                printf("\n");                                                  \
                printLen = MTMaxLineWidth;                                     \
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

#define memTrackerPanic(exitCode, msgPrefix, fmtMessage, ...)                  \
    do {                                                                       \
        int printLen = MTMaxLineWidth;                                         \
        uint64_t neededSize =                                                  \
            (uint64_t)snprintf(                                                \
                NULL, 0, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage,      \
                __FILE__, (uint64_t)__LINE__, ##__VA_ARGS__                    \
            ) +                                                                \
            1;                                                                 \
        char *theLog       = calloc(neededSize, sizeof(char));                 \
        uint64_t theLogLen = strlen(theLog);                                   \
        sprintf(                                                               \
            theLog, "(%s Line: %3" PRIu64 ") " msgPrefix fmtMessage, __FILE__, \
            (uint64_t)__LINE__, ##__VA_ARGS__                                  \
        );                                                                     \
                                                                               \
        char *copy = theLog;                                                   \
        while ((theLog + theLogLen) >= copy) {                                 \
            int wordLen = (int)strcspn(copy, " ");                             \
            if (wordLen > printLen) {                                          \
                printf("\n");                                                  \
                printLen = MTMaxLineWidth;                                     \
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

#endif // ___0001_CROI_C_RANDOM_HEADER_CODE___

#ifdef ___0001_CROI_C_RANDOM_HEADER_CODE_IMPL___

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

#include <inttypes.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct MemTrackerArr {
    bool init;
    uint64_t size;
    uint64_t used;
    void **ptrs;
} MemTrackerArr;
MemTrackerArr memTracker = {
    false,
    0,
    0,
    NULL,
};

void memTrackerInit(void)
{
    memTracker.init = true;
    memTracker.size = 8;
    memTracker.used = 0;
    memTracker.ptrs = calloc(memTracker.size, sizeof(void *));
    if (memTracker.ptrs == NULL)
        memTrackerPanic(
            1, MTCRIT, "Failed to initialize memtracker for bread parser :(\n"
        );

    atexit(memTrackerFree);
    signal(SIGINT, memTrackerFreeSignal);
}

void memTrackerFreeSignal(int sig)
{
    exit(sig);
}

void memTrackerFree(void)
{
    for (uint64_t i = 0; i < memTracker.used; i += 1) {
        free(memTracker.ptrs[i]);
    }
    memTracker.size = 0;
    memTracker.used = 0;
    memTracker.init = 0;
    free(memTracker.ptrs);
}

void memTrackerExpand(void)
{
    if (memTracker.size == (memTracker.used + 1)) {
        void **newTracker =
            realloc(memTracker.ptrs, memTracker.size * sizeof(void *) * 2);
        if (newTracker == NULL)
            memTrackerPanic(
                EXIT_FAILURE, MTCRIT,
                "Failed to expand list of pointers for the mem "
                "tracker of bread parser...\n"
            );

        for (uint64_t i = memTracker.size; i < memTracker.size * 2; i += 1) {
            newTracker[i] = NULL;
        }

        memTracker.size *= 2;
        memTracker.ptrs  = newTracker;
    }
}

int64_t memTrackerFindPtr(void *ptr)
{
    for (uint64_t i = 0; i < memTracker.used; i += 1) {
        if (memTracker.ptrs[i] == ptr)
            return i;
    }

    return -1;
}

void mTFree(void *ptr)
{
    int64_t ptrIndex = -1;
    for (uint64_t i = 0; i < memTracker.used; i += 1) {
        if (memTracker.ptrs[i] == ptr) {
            ptrIndex = i;
            break;
        }
    }

    if (ptrIndex != -1) {
        // Did I use memmove correctly to do this?
        // [0, 1, 2] pop(1)
        // [0, gone, 2]
        // [0, 2]
        memmove(
            memTracker.ptrs + ptrIndex, memTracker.ptrs + ptrIndex + 1,
            (memTracker.used - 1 - ptrIndex) * sizeof(void *)
        );
        memTracker.used                  -= 1;
        memTracker.ptrs[memTracker.used]  = NULL;
    }

    // Holy crap I forgot to call free from this (I did it again...)
    free(ptr);
}

void *mTMalloc(uint64_t size)
{
    if (!memTracker.init)
        memTrackerInit();

    void *res = malloc((size_t)size);
    if (res == NULL)
        memTrackerPanic(
            EXIT_FAILURE, MTCRIT,
            "Malloc returned null when trying to allocate memory for\n"
        );

    memTrackerExpand();

    memTracker.ptrs[memTracker.used]  = res;
    memTracker.used                  += 1;

    return res;
}

void *mTCalloc(uint64_t nmemb, uint64_t size)
{
    if (!memTracker.init)
        memTrackerInit();

    void *res = calloc((size_t)nmemb, (size_t)size);
    if (res == NULL)
        memTrackerPanic(
            EXIT_FAILURE, MTCRIT,
            "Calloc returned null when trying to allocate memory\n"
        );

    memTrackerExpand();
    memTracker.ptrs[memTracker.used]  = res;
    memTracker.used                  += 1;
    return res;
}

void *mTRealloc(void *ptr, uint64_t size)
{
    if (!memTracker.init)
        memTrackerInit();

    int64_t ptrIndex = memTrackerFindPtr(ptr);
    void *res        = realloc(ptr, (size_t)size);
    if (res == NULL)
        memTrackerPanic(
            EXIT_FAILURE, MTCRIT,
            "Realloc returned null when trying to allocate memory\n"
        );

    memTrackerExpand();
    if (ptrIndex != -1)
        memTracker.ptrs[ptrIndex] = res;
    else {
        memTracker.ptrs[memTracker.used]  = res;
        memTracker.used                  += 1;
    }

    return res;
}

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // ___0001_CROI_C_RANDOM_HEADER_CODE_IMPL___
