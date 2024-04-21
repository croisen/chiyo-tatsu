# Chiyo - Tatsu

A backup file converter from Tachiyomi to Kotatsu (a very wip project)

## TODOs

-   [x] Create the respective proto files with the kotlin definitions of the
        tachiyomi backup file
-   [x] Decompress the tachiyomi backup file
-   [x] Parse the tachiyomi backup file with protobuf
-   [x] Get the source IDs for tachiyomi
-   [ ] Figure out how the backups of kotatsu works

## Dependencies

-   [protobuf](https://github.com/protocolbuffers/protobuf)
-   [zlib](https://github.com/madler/zlib)
-   [tachiyomi_source_ids](https://raw.githubusercontent.com/ThePBone/tachiyomi-extensions-revived/repo/index.min.json)

## Struggles

### In C

-   Creating a self-made argparser (v1 in 3 days, v2 in 7 days)
-   Making the example usage of zlib fit my needs
-   protobuf-c doesn't support 'optional' in proto3 yet

### In Go

-   'option go_package' creating a path that I do not know of
-   protoc and go not rolling with what I know of with protoc and c
-   My backup file returning nothing when parsed with this...

### In C + CPP

-   Surprisingly nothing yet, and my tachiyomi backup seems to be parsed by this
-   Okay I admit that the compilation to other os is a struggle
-   Considering docker rn...
