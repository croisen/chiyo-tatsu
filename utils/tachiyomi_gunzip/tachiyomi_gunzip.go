package tachiyomi_gunzip

import (
	"compress/gzip"
	"fmt"
	"io"
	"os"

	"github.com/croisen/chiyo-tatsu/proto_files_go/tachiyomi"
	"google.golang.org/protobuf/proto"
)

func TGunZip(input *os.File) *tachiyomi.Backup {
	var protobuf_tachiyomi tachiyomi.Backup
	var decompressed_buffer []byte

	if input == nil {
		fmt.Println("Input file (tachiyomi backup) was not passed with -i or --input")
		os.Exit(1)
	}

	gzip_data, err := gzip.NewReader(input)
	if err != nil {
		fmt.Println("Error decompressing file", input.Name())
		fmt.Println(err)
		os.Exit(1)
	}

	read, err := io.ReadAll(gzip_data)
	if err != nil {
		fmt.Println("Error in reading decompressed file", input.Name())
		fmt.Println(err)
		os.Exit(1)
	}
	fmt.Println("Read", len(read), "Bytes from", input.Name())

	protobuf_tachiyomi.Reset()
	err = proto.Unmarshal(decompressed_buffer, &protobuf_tachiyomi)
	if err != nil {
		fmt.Println("Error parsing file", input.Name())
		fmt.Println(err)
		os.Exit(1)
	}

	return &protobuf_tachiyomi
}
