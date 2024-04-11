/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: backup_history.proto */

#ifndef PROTOBUF_C_backup_5fhistory_2eproto__INCLUDED
#define PROTOBUF_C_backup_5fhistory_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1005000 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif


typedef struct BrokenBackupHistory BrokenBackupHistory;
typedef struct BackupHistory BackupHistory;


/* --- enums --- */


/* --- messages --- */

struct  BrokenBackupHistory
{
  ProtobufCMessage base;
  char *url;
  int64_t lastread;
  int64_t readduration;
};
#define BROKEN_BACKUP_HISTORY__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&broken_backup_history__descriptor) \
, (char *)protobuf_c_empty_string, 0, 0 }


struct  BackupHistory
{
  ProtobufCMessage base;
  char *url;
  int64_t lastread;
  int64_t readduration;
};
#define BACKUP_HISTORY__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&backup_history__descriptor) \
, (char *)protobuf_c_empty_string, 0, 0 }


/* BrokenBackupHistory methods */
void   broken_backup_history__init
                     (BrokenBackupHistory         *message);
size_t broken_backup_history__get_packed_size
                     (const BrokenBackupHistory   *message);
size_t broken_backup_history__pack
                     (const BrokenBackupHistory   *message,
                      uint8_t             *out);
size_t broken_backup_history__pack_to_buffer
                     (const BrokenBackupHistory   *message,
                      ProtobufCBuffer     *buffer);
BrokenBackupHistory *
       broken_backup_history__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   broken_backup_history__free_unpacked
                     (BrokenBackupHistory *message,
                      ProtobufCAllocator *allocator);
/* BackupHistory methods */
void   backup_history__init
                     (BackupHistory         *message);
size_t backup_history__get_packed_size
                     (const BackupHistory   *message);
size_t backup_history__pack
                     (const BackupHistory   *message,
                      uint8_t             *out);
size_t backup_history__pack_to_buffer
                     (const BackupHistory   *message,
                      ProtobufCBuffer     *buffer);
BackupHistory *
       backup_history__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   backup_history__free_unpacked
                     (BackupHistory *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*BrokenBackupHistory_Closure)
                 (const BrokenBackupHistory *message,
                  void *closure_data);
typedef void (*BackupHistory_Closure)
                 (const BackupHistory *message,
                  void *closure_data);

/* --- services --- */


/* --- descriptors --- */

extern const ProtobufCMessageDescriptor broken_backup_history__descriptor;
extern const ProtobufCMessageDescriptor backup_history__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_backup_5fhistory_2eproto__INCLUDED */
