#ifndef ___0001_5_CROI_C_RANDOM_HEADER_CODE___
#define ___0001_5_CROI_C_RANDOM_HEADER_CODE___

// Well I'm trying out if this can work as a custom allocator for protobuf

#include "../other_includes/protobuf-c.h"
#include "memtracker.h"
#include <stdint.h>

extern ProtobufCAllocator customAllocator;

void *mTExMalloc(void *allocatorData, uint64_t size);
void mTExFree(void *allocatorData, void *ptr);

#endif // ___0001_5_CROI_C_RANDOM_HEADER_CODE___

#define ___0001_5_CROI_C_RANDOM_HEADER_CODE_IMPL___
#ifdef ___0001_5_CROI_C_RANDOM_HEADER_CODE_IMPL___

ProtobufCAllocator customAllocator = {
    .alloc          = mTExMalloc,
    .allocator_data = NULL,
    .free           = mTExFree,
};

void *mTExMalloc(void *allocatorData, uint64_t size)
{
    (void)allocatorData;
    return mTMalloc(size);
}

void mTExFree(void *allocatorData, void *ptr)
{
    (void)allocatorData;
    mTFree(ptr);
}

#endif // ___0001_5_CROI_C_RANDOM_HEADER_CODE_IMPL___
