package tachiyomi_gunzip

import (
	"compress/gzip"
	"fmt"
	"io"
	"os"

	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_backups"
	"google.golang.org/protobuf/proto"
)

func TGunZip(input string) *tachiyomi_backups.Backup {
	protobuf_tachiyomi := &tachiyomi_backups.Backup{}

	inputFile, err := os.Open(input)
	if err != nil {
		fmt.Println("Cannot read file: ", input)
		os.Exit(1)
	}
	defer inputFile.Close()

	gzip_data, err := gzip.NewReader(inputFile)
	if err != nil {
		fmt.Println("Error decompressing file", inputFile.Name())
		fmt.Println(err)
		os.Exit(1)
	}

	read, err := io.ReadAll(gzip_data)
	if err != nil {
		fmt.Println("Error in reading decompressed file", inputFile.Name())
		fmt.Println(err)
		os.Exit(1)
	}

	fmt.Println("Read", len(read), "Bytes from", inputFile.Name())
	// I was using the wrong buffer all along
	err = proto.Unmarshal(read, protobuf_tachiyomi)
	if err != nil {
		fmt.Println("Error parsing file", inputFile.Name())
		fmt.Println(err)
		os.Exit(1)
	}

	return protobuf_tachiyomi
}
