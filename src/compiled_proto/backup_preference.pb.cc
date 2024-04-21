// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: backup_preference.proto

#include "backup_preference.pb.h"

#include <algorithm>
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/extension_set.h"
#include "google/protobuf/wire_format_lite.h"
#include "google/protobuf/descriptor.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/reflection_ops.h"
#include "google/protobuf/wire_format.h"
#include "google/protobuf/generated_message_tctable_impl.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"
PROTOBUF_PRAGMA_INIT_SEG
namespace _pb = ::google::protobuf;
namespace _pbi = ::google::protobuf::internal;
namespace _fl = ::google::protobuf::internal::field_layout;

inline constexpr BackupPreference::Impl_::Impl_(
    ::_pbi::ConstantInitialized) noexcept
      : key_(
            &::google::protobuf::internal::fixed_address_empty_string,
            ::_pbi::ConstantInitialized()),
        value_{},
        _cached_size_{0},
        _oneof_case_{} {}

template <typename>
PROTOBUF_CONSTEXPR BackupPreference::BackupPreference(::_pbi::ConstantInitialized)
    : _impl_(::_pbi::ConstantInitialized()) {}
struct BackupPreferenceDefaultTypeInternal {
  PROTOBUF_CONSTEXPR BackupPreferenceDefaultTypeInternal() : _instance(::_pbi::ConstantInitialized{}) {}
  ~BackupPreferenceDefaultTypeInternal() {}
  union {
    BackupPreference _instance;
  };
};

PROTOBUF_ATTRIBUTE_NO_DESTROY PROTOBUF_CONSTINIT
    PROTOBUF_ATTRIBUTE_INIT_PRIORITY1 BackupPreferenceDefaultTypeInternal _BackupPreference_default_instance_;

inline constexpr BackupSourcePreferences::Impl_::Impl_(
    ::_pbi::ConstantInitialized) noexcept
      : prefs_{},
        source_key_(
            &::google::protobuf::internal::fixed_address_empty_string,
            ::_pbi::ConstantInitialized()),
        _cached_size_{0} {}

template <typename>
PROTOBUF_CONSTEXPR BackupSourcePreferences::BackupSourcePreferences(::_pbi::ConstantInitialized)
    : _impl_(::_pbi::ConstantInitialized()) {}
struct BackupSourcePreferencesDefaultTypeInternal {
  PROTOBUF_CONSTEXPR BackupSourcePreferencesDefaultTypeInternal() : _instance(::_pbi::ConstantInitialized{}) {}
  ~BackupSourcePreferencesDefaultTypeInternal() {}
  union {
    BackupSourcePreferences _instance;
  };
};

PROTOBUF_ATTRIBUTE_NO_DESTROY PROTOBUF_CONSTINIT
    PROTOBUF_ATTRIBUTE_INIT_PRIORITY1 BackupSourcePreferencesDefaultTypeInternal _BackupSourcePreferences_default_instance_;
static ::_pb::Metadata file_level_metadata_backup_5fpreference_2eproto[2];
static const ::_pb::EnumDescriptor* file_level_enum_descriptors_backup_5fpreference_2eproto[1];
static constexpr const ::_pb::ServiceDescriptor**
    file_level_service_descriptors_backup_5fpreference_2eproto = nullptr;
const ::uint32_t TableStruct_backup_5fpreference_2eproto::offsets[] PROTOBUF_SECTION_VARIABLE(
    protodesc_cold) = {
    ~0u,  // no _has_bits_
    PROTOBUF_FIELD_OFFSET(::BackupPreference, _internal_metadata_),
    ~0u,  // no _extensions_
    PROTOBUF_FIELD_OFFSET(::BackupPreference, _impl_._oneof_case_[0]),
    ~0u,  // no _weak_field_map_
    ~0u,  // no _inlined_string_donated_
    ~0u,  // no _split_
    ~0u,  // no sizeof(Split)
    PROTOBUF_FIELD_OFFSET(::BackupPreference, _impl_.key_),
    ::_pbi::kInvalidFieldOffsetTag,
    ::_pbi::kInvalidFieldOffsetTag,
    ::_pbi::kInvalidFieldOffsetTag,
    ::_pbi::kInvalidFieldOffsetTag,
    ::_pbi::kInvalidFieldOffsetTag,
    ::_pbi::kInvalidFieldOffsetTag,
    PROTOBUF_FIELD_OFFSET(::BackupPreference, _impl_.value_),
    ~0u,  // no _has_bits_
    PROTOBUF_FIELD_OFFSET(::BackupSourcePreferences, _internal_metadata_),
    ~0u,  // no _extensions_
    ~0u,  // no _oneof_case_
    ~0u,  // no _weak_field_map_
    ~0u,  // no _inlined_string_donated_
    ~0u,  // no _split_
    ~0u,  // no sizeof(Split)
    PROTOBUF_FIELD_OFFSET(::BackupSourcePreferences, _impl_.source_key_),
    PROTOBUF_FIELD_OFFSET(::BackupSourcePreferences, _impl_.prefs_),
};

static const ::_pbi::MigrationSchema
    schemas[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
        {0, -1, -1, sizeof(::BackupPreference)},
        {16, -1, -1, sizeof(::BackupSourcePreferences)},
};

static const ::_pb::Message* const file_default_instances[] = {
    &::_BackupPreference_default_instance_._instance,
    &::_BackupSourcePreferences_default_instance_._instance,
};
const char descriptor_table_protodef_backup_5fpreference_2eproto[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
    "\n\027backup_preference.proto\"\264\001\n\020BackupPref"
    "erence\022\013\n\003key\030\001 \001(\t\022\023\n\tint_value\030\002 \001(\005H\000"
    "\022\024\n\nlong_value\030\003 \001(\003H\000\022\025\n\013float_value\030\004 "
    "\001(\002H\000\022\026\n\014string_value\030\005 \001(\tH\000\022\024\n\nbool_va"
    "lue\030\006 \001(\010H\000\022\032\n\020string_set_value\030\007 \001(\tH\000B"
    "\007\n\005value\"O\n\027BackupSourcePreferences\022\022\n\ns"
    "ource_key\030\001 \001(\t\022 \n\005prefs\030\002 \003(\0132\021.BackupP"
    "reference*\206\001\n\017PreferenceValue\022\013\n\007UNKNOWN"
    "\020\000\022\r\n\tINT_VALUE\020\002\022\016\n\nLONG_VALUE\020\003\022\017\n\013FLO"
    "AT_VALUE\020\004\022\020\n\014STRING_VALUE\020\005\022\016\n\nBOOL_VAL"
    "UE\020\006\022\024\n\020STRING_SET_VALUE\020\007b\006proto3"
};
static ::absl::once_flag descriptor_table_backup_5fpreference_2eproto_once;
const ::_pbi::DescriptorTable descriptor_table_backup_5fpreference_2eproto = {
    false,
    false,
    434,
    descriptor_table_protodef_backup_5fpreference_2eproto,
    "backup_preference.proto",
    &descriptor_table_backup_5fpreference_2eproto_once,
    nullptr,
    0,
    2,
    schemas,
    file_default_instances,
    TableStruct_backup_5fpreference_2eproto::offsets,
    file_level_metadata_backup_5fpreference_2eproto,
    file_level_enum_descriptors_backup_5fpreference_2eproto,
    file_level_service_descriptors_backup_5fpreference_2eproto,
};

// This function exists to be marked as weak.
// It can significantly speed up compilation by breaking up LLVM's SCC
// in the .pb.cc translation units. Large translation units see a
// reduction of more than 35% of walltime for optimized builds. Without
// the weak attribute all the messages in the file, including all the
// vtables and everything they use become part of the same SCC through
// a cycle like:
// GetMetadata -> descriptor table -> default instances ->
//   vtables -> GetMetadata
// By adding a weak function here we break the connection from the
// individual vtables back into the descriptor table.
PROTOBUF_ATTRIBUTE_WEAK const ::_pbi::DescriptorTable* descriptor_table_backup_5fpreference_2eproto_getter() {
  return &descriptor_table_backup_5fpreference_2eproto;
}
// Force running AddDescriptors() at dynamic initialization time.
PROTOBUF_ATTRIBUTE_INIT_PRIORITY2
static ::_pbi::AddDescriptorsRunner dynamic_init_dummy_backup_5fpreference_2eproto(&descriptor_table_backup_5fpreference_2eproto);
const ::google::protobuf::EnumDescriptor* PreferenceValue_descriptor() {
  ::google::protobuf::internal::AssignDescriptors(&descriptor_table_backup_5fpreference_2eproto);
  return file_level_enum_descriptors_backup_5fpreference_2eproto[0];
}
PROTOBUF_CONSTINIT const uint32_t PreferenceValue_internal_data_[] = {
    65536u, 32u, 126u, };
bool PreferenceValue_IsValid(int value) {
  return 0 <= value && value <= 7 && ((253u >> value) & 1) != 0;
}
// ===================================================================

class BackupPreference::_Internal {
 public:
  static constexpr ::int32_t kOneofCaseOffset =
    PROTOBUF_FIELD_OFFSET(::BackupPreference, _impl_._oneof_case_);
};

BackupPreference::BackupPreference(::google::protobuf::Arena* arena)
    : ::google::protobuf::Message(arena) {
  SharedCtor(arena);
  // @@protoc_insertion_point(arena_constructor:BackupPreference)
}
inline PROTOBUF_NDEBUG_INLINE BackupPreference::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility, ::google::protobuf::Arena* arena,
    const Impl_& from)
      : key_(arena, from.key_),
        value_{},
        _cached_size_{0},
        _oneof_case_{from._oneof_case_[0]} {}

BackupPreference::BackupPreference(
    ::google::protobuf::Arena* arena,
    const BackupPreference& from)
    : ::google::protobuf::Message(arena) {
  BackupPreference* const _this = this;
  (void)_this;
  _internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(
      from._internal_metadata_);
  new (&_impl_) Impl_(internal_visibility(), arena, from._impl_);
  switch (value_case()) {
    case VALUE_NOT_SET:
      break;
      case kIntValue:
        _impl_.value_.int_value_ = from._impl_.value_.int_value_;
        break;
      case kLongValue:
        _impl_.value_.long_value_ = from._impl_.value_.long_value_;
        break;
      case kFloatValue:
        _impl_.value_.float_value_ = from._impl_.value_.float_value_;
        break;
      case kStringValue:
        new (&_impl_.value_.string_value_) decltype(_impl_.value_.string_value_){arena, from._impl_.value_.string_value_};
        break;
      case kBoolValue:
        _impl_.value_.bool_value_ = from._impl_.value_.bool_value_;
        break;
      case kStringSetValue:
        new (&_impl_.value_.string_set_value_) decltype(_impl_.value_.string_set_value_){arena, from._impl_.value_.string_set_value_};
        break;
  }

  // @@protoc_insertion_point(copy_constructor:BackupPreference)
}
inline PROTOBUF_NDEBUG_INLINE BackupPreference::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility,
    ::google::protobuf::Arena* arena)
      : key_(arena),
        value_{},
        _cached_size_{0},
        _oneof_case_{} {}

inline void BackupPreference::SharedCtor(::_pb::Arena* arena) {
  new (&_impl_) Impl_(internal_visibility(), arena);
}
BackupPreference::~BackupPreference() {
  // @@protoc_insertion_point(destructor:BackupPreference)
  _internal_metadata_.Delete<::google::protobuf::UnknownFieldSet>();
  SharedDtor();
}
inline void BackupPreference::SharedDtor() {
  ABSL_DCHECK(GetArena() == nullptr);
  _impl_.key_.Destroy();
  if (has_value()) {
    clear_value();
  }
  _impl_.~Impl_();
}

void BackupPreference::clear_value() {
// @@protoc_insertion_point(one_of_clear_start:BackupPreference)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  switch (value_case()) {
    case kIntValue: {
      // No need to clear
      break;
    }
    case kLongValue: {
      // No need to clear
      break;
    }
    case kFloatValue: {
      // No need to clear
      break;
    }
    case kStringValue: {
      _impl_.value_.string_value_.Destroy();
      break;
    }
    case kBoolValue: {
      // No need to clear
      break;
    }
    case kStringSetValue: {
      _impl_.value_.string_set_value_.Destroy();
      break;
    }
    case VALUE_NOT_SET: {
      break;
    }
  }
  _impl_._oneof_case_[0] = VALUE_NOT_SET;
}


PROTOBUF_NOINLINE void BackupPreference::Clear() {
// @@protoc_insertion_point(message_clear_start:BackupPreference)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  _impl_.key_.ClearToEmpty();
  clear_value();
  _internal_metadata_.Clear<::google::protobuf::UnknownFieldSet>();
}

const char* BackupPreference::_InternalParse(
    const char* ptr, ::_pbi::ParseContext* ctx) {
  ptr = ::_pbi::TcParser::ParseLoop(this, ptr, ctx, &_table_.header);
  return ptr;
}


PROTOBUF_CONSTINIT PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::_pbi::TcParseTable<0, 7, 0, 56, 2> BackupPreference::_table_ = {
  {
    0,  // no _has_bits_
    0, // no _extensions_
    7, 0,  // max_field_number, fast_idx_mask
    offsetof(decltype(_table_), field_lookup_table),
    4294967168,  // skipmap
    offsetof(decltype(_table_), field_entries),
    7,  // num_field_entries
    0,  // num_aux_entries
    offsetof(decltype(_table_), field_names),  // no aux_entries
    &_BackupPreference_default_instance_._instance,
    ::_pbi::TcParser::GenericFallback,  // fallback
  }, {{
    // string key = 1;
    {::_pbi::TcParser::FastUS1,
     {10, 63, 0, PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.key_)}},
  }}, {{
    65535, 65535
  }}, {{
    // string key = 1;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.key_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUtf8String | ::_fl::kRepAString)},
    // int32 int_value = 2;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.int_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kInt32)},
    // int64 long_value = 3;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.long_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kInt64)},
    // float float_value = 4;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.float_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kFloat)},
    // string string_value = 5;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.string_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kUtf8String | ::_fl::kRepAString)},
    // bool bool_value = 6;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.bool_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kBool)},
    // string string_set_value = 7;
    {PROTOBUF_FIELD_OFFSET(BackupPreference, _impl_.value_.string_set_value_), _Internal::kOneofCaseOffset + 0, 0,
    (0 | ::_fl::kFcOneof | ::_fl::kUtf8String | ::_fl::kRepAString)},
  }},
  // no aux_entries
  {{
    "\20\3\0\0\0\14\0\20"
    "BackupPreference"
    "key"
    "string_value"
    "string_set_value"
  }},
};

::uint8_t* BackupPreference::_InternalSerialize(
    ::uint8_t* target,
    ::google::protobuf::io::EpsCopyOutputStream* stream) const {
  // @@protoc_insertion_point(serialize_to_array_start:BackupPreference)
  ::uint32_t cached_has_bits = 0;
  (void)cached_has_bits;

  // string key = 1;
  if (!this->_internal_key().empty()) {
    const std::string& _s = this->_internal_key();
    ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
        _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "BackupPreference.key");
    target = stream->WriteStringMaybeAliased(1, _s, target);
  }

  switch (value_case()) {
    case kIntValue: {
      target = ::google::protobuf::internal::WireFormatLite::
          WriteInt32ToArrayWithField<2>(
              stream, this->_internal_int_value(), target);
      break;
    }
    case kLongValue: {
      target = ::google::protobuf::internal::WireFormatLite::
          WriteInt64ToArrayWithField<3>(
              stream, this->_internal_long_value(), target);
      break;
    }
    case kFloatValue: {
      target = stream->EnsureSpace(target);
      target = ::_pbi::WireFormatLite::WriteFloatToArray(
          4, this->_internal_float_value(), target);
      break;
    }
    case kStringValue: {
      const std::string& _s = this->_internal_string_value();
      ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
          _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "BackupPreference.string_value");
      target = stream->WriteStringMaybeAliased(5, _s, target);
      break;
    }
    case kBoolValue: {
      target = stream->EnsureSpace(target);
      target = ::_pbi::WireFormatLite::WriteBoolToArray(
          6, this->_internal_bool_value(), target);
      break;
    }
    case kStringSetValue: {
      const std::string& _s = this->_internal_string_set_value();
      ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
          _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "BackupPreference.string_set_value");
      target = stream->WriteStringMaybeAliased(7, _s, target);
      break;
    }
    default:
      break;
  }
  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    target =
        ::_pbi::WireFormat::InternalSerializeUnknownFieldsToArray(
            _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance), target, stream);
  }
  // @@protoc_insertion_point(serialize_to_array_end:BackupPreference)
  return target;
}

::size_t BackupPreference::ByteSizeLong() const {
// @@protoc_insertion_point(message_byte_size_start:BackupPreference)
  ::size_t total_size = 0;

  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  // string key = 1;
  if (!this->_internal_key().empty()) {
    total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                    this->_internal_key());
  }

  switch (value_case()) {
    // int32 int_value = 2;
    case kIntValue: {
      total_size += ::_pbi::WireFormatLite::Int32SizePlusOne(
          this->_internal_int_value());
      break;
    }
    // int64 long_value = 3;
    case kLongValue: {
      total_size += ::_pbi::WireFormatLite::Int64SizePlusOne(
          this->_internal_long_value());
      break;
    }
    // float float_value = 4;
    case kFloatValue: {
      total_size += 5;
      break;
    }
    // string string_value = 5;
    case kStringValue: {
      total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                      this->_internal_string_value());
      break;
    }
    // bool bool_value = 6;
    case kBoolValue: {
      total_size += 2;
      break;
    }
    // string string_set_value = 7;
    case kStringSetValue: {
      total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                      this->_internal_string_set_value());
      break;
    }
    case VALUE_NOT_SET: {
      break;
    }
  }
  return MaybeComputeUnknownFieldsSize(total_size, &_impl_._cached_size_);
}

const ::google::protobuf::Message::ClassData BackupPreference::_class_data_ = {
    BackupPreference::MergeImpl,
    nullptr,  // OnDemandRegisterArenaDtor
};
const ::google::protobuf::Message::ClassData* BackupPreference::GetClassData() const {
  return &_class_data_;
}

void BackupPreference::MergeImpl(::google::protobuf::Message& to_msg, const ::google::protobuf::Message& from_msg) {
  auto* const _this = static_cast<BackupPreference*>(&to_msg);
  auto& from = static_cast<const BackupPreference&>(from_msg);
  // @@protoc_insertion_point(class_specific_merge_from_start:BackupPreference)
  ABSL_DCHECK_NE(&from, _this);
  ::uint32_t cached_has_bits = 0;
  (void) cached_has_bits;

  if (!from._internal_key().empty()) {
    _this->_internal_set_key(from._internal_key());
  }
  switch (from.value_case()) {
    case kIntValue: {
      _this->_internal_set_int_value(from._internal_int_value());
      break;
    }
    case kLongValue: {
      _this->_internal_set_long_value(from._internal_long_value());
      break;
    }
    case kFloatValue: {
      _this->_internal_set_float_value(from._internal_float_value());
      break;
    }
    case kStringValue: {
      _this->_internal_set_string_value(from._internal_string_value());
      break;
    }
    case kBoolValue: {
      _this->_internal_set_bool_value(from._internal_bool_value());
      break;
    }
    case kStringSetValue: {
      _this->_internal_set_string_set_value(from._internal_string_set_value());
      break;
    }
    case VALUE_NOT_SET: {
      break;
    }
  }
  _this->_internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(from._internal_metadata_);
}

void BackupPreference::CopyFrom(const BackupPreference& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:BackupPreference)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

PROTOBUF_NOINLINE bool BackupPreference::IsInitialized() const {
  return true;
}

::_pbi::CachedSize* BackupPreference::AccessCachedSize() const {
  return &_impl_._cached_size_;
}
void BackupPreference::InternalSwap(BackupPreference* PROTOBUF_RESTRICT other) {
  using std::swap;
  auto* arena = GetArena();
  ABSL_DCHECK_EQ(arena, other->GetArena());
  _internal_metadata_.InternalSwap(&other->_internal_metadata_);
  ::_pbi::ArenaStringPtr::InternalSwap(&_impl_.key_, &other->_impl_.key_, arena);
  swap(_impl_.value_, other->_impl_.value_);
  swap(_impl_._oneof_case_[0], other->_impl_._oneof_case_[0]);
}

::google::protobuf::Metadata BackupPreference::GetMetadata() const {
  return ::_pbi::AssignDescriptors(
      &descriptor_table_backup_5fpreference_2eproto_getter, &descriptor_table_backup_5fpreference_2eproto_once,
      file_level_metadata_backup_5fpreference_2eproto[0]);
}
// ===================================================================

class BackupSourcePreferences::_Internal {
 public:
};

BackupSourcePreferences::BackupSourcePreferences(::google::protobuf::Arena* arena)
    : ::google::protobuf::Message(arena) {
  SharedCtor(arena);
  // @@protoc_insertion_point(arena_constructor:BackupSourcePreferences)
}
inline PROTOBUF_NDEBUG_INLINE BackupSourcePreferences::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility, ::google::protobuf::Arena* arena,
    const Impl_& from)
      : prefs_{visibility, arena, from.prefs_},
        source_key_(arena, from.source_key_),
        _cached_size_{0} {}

BackupSourcePreferences::BackupSourcePreferences(
    ::google::protobuf::Arena* arena,
    const BackupSourcePreferences& from)
    : ::google::protobuf::Message(arena) {
  BackupSourcePreferences* const _this = this;
  (void)_this;
  _internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(
      from._internal_metadata_);
  new (&_impl_) Impl_(internal_visibility(), arena, from._impl_);

  // @@protoc_insertion_point(copy_constructor:BackupSourcePreferences)
}
inline PROTOBUF_NDEBUG_INLINE BackupSourcePreferences::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility,
    ::google::protobuf::Arena* arena)
      : prefs_{visibility, arena},
        source_key_(arena),
        _cached_size_{0} {}

inline void BackupSourcePreferences::SharedCtor(::_pb::Arena* arena) {
  new (&_impl_) Impl_(internal_visibility(), arena);
}
BackupSourcePreferences::~BackupSourcePreferences() {
  // @@protoc_insertion_point(destructor:BackupSourcePreferences)
  _internal_metadata_.Delete<::google::protobuf::UnknownFieldSet>();
  SharedDtor();
}
inline void BackupSourcePreferences::SharedDtor() {
  ABSL_DCHECK(GetArena() == nullptr);
  _impl_.source_key_.Destroy();
  _impl_.~Impl_();
}

PROTOBUF_NOINLINE void BackupSourcePreferences::Clear() {
// @@protoc_insertion_point(message_clear_start:BackupSourcePreferences)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  _impl_.prefs_.Clear();
  _impl_.source_key_.ClearToEmpty();
  _internal_metadata_.Clear<::google::protobuf::UnknownFieldSet>();
}

const char* BackupSourcePreferences::_InternalParse(
    const char* ptr, ::_pbi::ParseContext* ctx) {
  ptr = ::_pbi::TcParser::ParseLoop(this, ptr, ctx, &_table_.header);
  return ptr;
}


PROTOBUF_CONSTINIT PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::_pbi::TcParseTable<1, 2, 1, 42, 2> BackupSourcePreferences::_table_ = {
  {
    0,  // no _has_bits_
    0, // no _extensions_
    2, 8,  // max_field_number, fast_idx_mask
    offsetof(decltype(_table_), field_lookup_table),
    4294967292,  // skipmap
    offsetof(decltype(_table_), field_entries),
    2,  // num_field_entries
    1,  // num_aux_entries
    offsetof(decltype(_table_), aux_entries),
    &_BackupSourcePreferences_default_instance_._instance,
    ::_pbi::TcParser::GenericFallback,  // fallback
  }, {{
    // repeated .BackupPreference prefs = 2;
    {::_pbi::TcParser::FastMtR1,
     {18, 63, 0, PROTOBUF_FIELD_OFFSET(BackupSourcePreferences, _impl_.prefs_)}},
    // string source_key = 1;
    {::_pbi::TcParser::FastUS1,
     {10, 63, 0, PROTOBUF_FIELD_OFFSET(BackupSourcePreferences, _impl_.source_key_)}},
  }}, {{
    65535, 65535
  }}, {{
    // string source_key = 1;
    {PROTOBUF_FIELD_OFFSET(BackupSourcePreferences, _impl_.source_key_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUtf8String | ::_fl::kRepAString)},
    // repeated .BackupPreference prefs = 2;
    {PROTOBUF_FIELD_OFFSET(BackupSourcePreferences, _impl_.prefs_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kMessage | ::_fl::kTvTable)},
  }}, {{
    {::_pbi::TcParser::GetTable<::BackupPreference>()},
  }}, {{
    "\27\12\0\0\0\0\0\0"
    "BackupSourcePreferences"
    "source_key"
  }},
};

::uint8_t* BackupSourcePreferences::_InternalSerialize(
    ::uint8_t* target,
    ::google::protobuf::io::EpsCopyOutputStream* stream) const {
  // @@protoc_insertion_point(serialize_to_array_start:BackupSourcePreferences)
  ::uint32_t cached_has_bits = 0;
  (void)cached_has_bits;

  // string source_key = 1;
  if (!this->_internal_source_key().empty()) {
    const std::string& _s = this->_internal_source_key();
    ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
        _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "BackupSourcePreferences.source_key");
    target = stream->WriteStringMaybeAliased(1, _s, target);
  }

  // repeated .BackupPreference prefs = 2;
  for (unsigned i = 0,
      n = static_cast<unsigned>(this->_internal_prefs_size()); i < n; i++) {
    const auto& repfield = this->_internal_prefs().Get(i);
    target = ::google::protobuf::internal::WireFormatLite::
        InternalWriteMessage(2, repfield, repfield.GetCachedSize(), target, stream);
  }

  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    target =
        ::_pbi::WireFormat::InternalSerializeUnknownFieldsToArray(
            _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance), target, stream);
  }
  // @@protoc_insertion_point(serialize_to_array_end:BackupSourcePreferences)
  return target;
}

::size_t BackupSourcePreferences::ByteSizeLong() const {
// @@protoc_insertion_point(message_byte_size_start:BackupSourcePreferences)
  ::size_t total_size = 0;

  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  // repeated .BackupPreference prefs = 2;
  total_size += 1UL * this->_internal_prefs_size();
  for (const auto& msg : this->_internal_prefs()) {
    total_size +=
      ::google::protobuf::internal::WireFormatLite::MessageSize(msg);
  }
  // string source_key = 1;
  if (!this->_internal_source_key().empty()) {
    total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                    this->_internal_source_key());
  }

  return MaybeComputeUnknownFieldsSize(total_size, &_impl_._cached_size_);
}

const ::google::protobuf::Message::ClassData BackupSourcePreferences::_class_data_ = {
    BackupSourcePreferences::MergeImpl,
    nullptr,  // OnDemandRegisterArenaDtor
};
const ::google::protobuf::Message::ClassData* BackupSourcePreferences::GetClassData() const {
  return &_class_data_;
}

void BackupSourcePreferences::MergeImpl(::google::protobuf::Message& to_msg, const ::google::protobuf::Message& from_msg) {
  auto* const _this = static_cast<BackupSourcePreferences*>(&to_msg);
  auto& from = static_cast<const BackupSourcePreferences&>(from_msg);
  // @@protoc_insertion_point(class_specific_merge_from_start:BackupSourcePreferences)
  ABSL_DCHECK_NE(&from, _this);
  ::uint32_t cached_has_bits = 0;
  (void) cached_has_bits;

  _this->_internal_mutable_prefs()->MergeFrom(
      from._internal_prefs());
  if (!from._internal_source_key().empty()) {
    _this->_internal_set_source_key(from._internal_source_key());
  }
  _this->_internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(from._internal_metadata_);
}

void BackupSourcePreferences::CopyFrom(const BackupSourcePreferences& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:BackupSourcePreferences)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

PROTOBUF_NOINLINE bool BackupSourcePreferences::IsInitialized() const {
  return true;
}

::_pbi::CachedSize* BackupSourcePreferences::AccessCachedSize() const {
  return &_impl_._cached_size_;
}
void BackupSourcePreferences::InternalSwap(BackupSourcePreferences* PROTOBUF_RESTRICT other) {
  using std::swap;
  auto* arena = GetArena();
  ABSL_DCHECK_EQ(arena, other->GetArena());
  _internal_metadata_.InternalSwap(&other->_internal_metadata_);
  _impl_.prefs_.InternalSwap(&other->_impl_.prefs_);
  ::_pbi::ArenaStringPtr::InternalSwap(&_impl_.source_key_, &other->_impl_.source_key_, arena);
}

::google::protobuf::Metadata BackupSourcePreferences::GetMetadata() const {
  return ::_pbi::AssignDescriptors(
      &descriptor_table_backup_5fpreference_2eproto_getter, &descriptor_table_backup_5fpreference_2eproto_once,
      file_level_metadata_backup_5fpreference_2eproto[1]);
}
// @@protoc_insertion_point(namespace_scope)
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google
// @@protoc_insertion_point(global_scope)
#include "google/protobuf/port_undef.inc"
