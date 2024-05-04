#include <cstdlib>
#include <fstream>
#include <string>

#include "google/protobuf/io/gzip_stream.h"
#include "google/protobuf/io/zero_copy_stream_impl.h"

#include "../compiled_proto/tachiyomi.pb.h"
#include "col_lim_fprintf.hpp"

using namespace std;
using namespace google::protobuf::io;

namespace tachiyomi
{
Backup parseTachiyomiFile(string input)
{
    Backup tachiyomiBackup;
    ifstream tFile(input, ios::in | ios::binary);
    if (!tFile.is_open())
        chiyotatsuPanic(
            EXIT_FAILURE, CHFAIL, "Cannot open tachiyomi backup file: %s\n",
            input.c_str()
        );

    IstreamInputStream tFileStream(&tFile);
    GzipInputStream tFileGzip(&tFileStream, GzipInputStream::GZIP, -1);
    tachiyomiBackup.ParseFromZeroCopyStream(&tFileGzip);
    return tachiyomiBackup;
}
} // namespace tachiyomi
