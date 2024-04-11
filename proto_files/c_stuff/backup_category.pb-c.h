/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: backup_category.proto */

#ifndef PROTOBUF_C_backup_5fcategory_2eproto__INCLUDED
#define PROTOBUF_C_backup_5fcategory_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1005000 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif


typedef struct BackupCategory BackupCategory;


/* --- enums --- */


/* --- messages --- */

struct  BackupCategory
{
  ProtobufCMessage base;
  char *name;
  /*
   *int32 updateInterval = 3;
   */
  int32_t order;
  int32_t flags;
};
#define BACKUP_CATEGORY__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&backup_category__descriptor) \
, (char *)protobuf_c_empty_string, 0, 0 }


/* BackupCategory methods */
void   backup_category__init
                     (BackupCategory         *message);
size_t backup_category__get_packed_size
                     (const BackupCategory   *message);
size_t backup_category__pack
                     (const BackupCategory   *message,
                      uint8_t             *out);
size_t backup_category__pack_to_buffer
                     (const BackupCategory   *message,
                      ProtobufCBuffer     *buffer);
BackupCategory *
       backup_category__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   backup_category__free_unpacked
                     (BackupCategory *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*BackupCategory_Closure)
                 (const BackupCategory *message,
                  void *closure_data);

/* --- services --- */


/* --- descriptors --- */

extern const ProtobufCMessageDescriptor backup_category__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_backup_5fcategory_2eproto__INCLUDED */