/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: manga_update_strategy.proto */

#ifndef PROTOBUF_C_manga_5fupdate_5fstrategy_2eproto__INCLUDED
#define PROTOBUF_C_manga_5fupdate_5fstrategy_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1005000 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif




/* --- enums --- */

typedef enum _UpdateStrategy {
  UPDATE_STRATEGY__ALWAYS_UPDATE = 0,
  UPDATE_STRATEGY__ONLY_FETCH_ONCE = 1
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(UPDATE_STRATEGY)
} UpdateStrategy;

/* --- messages --- */

/* --- per-message closures --- */


/* --- services --- */


/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    update_strategy__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_manga_5fupdate_5fstrategy_2eproto__INCLUDED */