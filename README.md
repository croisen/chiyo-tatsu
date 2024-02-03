# Chiyo - Tatsu

A backup file converter from Tachiyomi to Kotatsu (a very wip project)

## Todo (While using C)

-   [x] Get my own header library commandline parser
-   [x] Close the files when there's a sudden exit
-   [x] Use make as a build system for other c files inside the others folder
-   [x] Decompress the tachiyomi backup file
-   [ ] After losing my sanity, rewrite this in kotlin instead
-   [ ] Get the documentation for the tachiyomi backup file
-   [ ] Try to parse the tachiyomi backup file
-   [ ] Get the documentation for the kotatsu backup file
-   [ ] Struggle converting between the two
-   [ ] Struggle in writing the zip file backup of kotatsu

## Manual Installation (It's very incomplete though)

Try to have all the dependencies installed and run the following

```bash
git clone "https://github.com/croisen/chiyo-tatsu.git"
cd chiyo-tatsu/
make
```

## External Libraries Used

-   [protobuf-c](https://github.com/protobuf-c/protobuf-c)
-   [zlib](https://github.com/madler/zlib)

## Dependencies of said External Libraries

-   automake
-   autoconf
-   binutils
-   cmake
-   make
-   protoc

-   libtool
-   libprotobuf
