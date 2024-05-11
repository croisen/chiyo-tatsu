# Chiyo - Tatsu

A backup file converter from Tachiyomi to Kotatsu (a very wip project)

## Building chiyotatsu

Download go (at least version 1.22.3) via your package manager or manually by

### Downloading Go on Linux

```bash
wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
rm go1.22.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

### Downloading Go on Windows

-   Pick the appropriate installer here [Go DL](https://go.dev/dl/) or use this directly [go1.22.3](https://go.dev/dl/go1.22.3.windows-amd64.msi)
-   Go through the installation wizard presented by the msi file
-   Re-open any command prompts or powershells that you need to use go with

### Building the executable

#### Linux

```bash
go -ldflags="-s -w" -o chiyotatsu.elf
```

#### Windows

```powershell
go -ldflags="-s -w" -o chiyotatsu.exe
```

## Dependencies

[Keiyoushi's Tachiyomi Extensions](https://github.com/keiyoushi/extensions)
[PBone's Tachiyomi Extensions Revived](https://github.com/ThePBone/tachiyomi-extensions-revived/)

## TODOs

-   [x] Create the respective proto files with the kotlin definitions of the
        tachiyomi backup file
-   [x] Decompress the tachiyomi backup file
-   [x] Parse the tachiyomi backup file with protobuf
-   [x] Get the source IDs for tachiyomi
-   [x] Figure out how the backups of kotatsu works (Sorta)
-   [ ] Figure out how the backups of kotatsu works
-   [x] Hope there's an easy 1 to 1 conversion and no mandatory fields in the
        kotatsu backups (there kinda is?)
-   [ ] Hope there's an easy 1 to 1 conversion and no mandatory fields in the
        kotatsu backups
-   [ ] Kotatsu, where is your database, please help
-   [ ] May the default rando values not be needed when the db comes to light
        (I don't have any experience with kotlin other than this :()
