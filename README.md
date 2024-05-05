# Chiyo - Tatsu

A backup file converter from Tachiyomi to Kotatsu (a very wip project)

## TODOs

-   [x] Figure out the linker errors happening with absl_log_internal
        (well I do hope that this is the end of it)
-   [ ] How to compile for 32 bit while on an x86_64 machine in linux
-   [ ] Finish the windows makefiles both 32 and 64 bit with or without prefixes
-   [ ] Bring back the auto build workflow when every todo is done
-   [x] Create the respective proto files with the kotlin definitions of the
        tachiyomi backup file
-   [x] Decompress the tachiyomi backup file
-   [x] Parse the tachiyomi backup file with protobuf
-   [x] Get the source IDs for tachiyomi
-   [ ] Figure out how the backups of kotatsu works
-   [ ] Hope there's an easy 1 to 1 conversion and no mandatory fields in the
        kotatsu backups
-   [ ] Kotatsu, where is your database, please help

## Dependencies

-   [abseil-cpp](https://github.com/abseil/abseil-cpp.git)
-   [jsoncpp](https://github.com/open-source-parsers/jsoncpp)
-   [protobuf](https://github.com/protocolbuffers/protobuf)
-   [zip](https://github.com/nih-at/libzip)
-   [zlib](https://github.com/madler/zlib)
-   [PBone's Tachiyomi Sources Revived](https://raw.githubusercontent.com/ThePBone/tachiyomi-extensions-revived/repo/index.min.json)
