package main

import (
	"fmt"
	"os"

	"github.com/croisen/chiyo-tatsu/utils/args"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_gunzip"
)

func main() {
	arg := args.CreateArgs()
	if arg.Input == nil {
		fmt.Println("Input file (tachiyomi backup) was not passed with -i or --input")
		os.Exit(1)
	}

	tyomi_protobuf := tachiyomi_gunzip.TGunZip(arg.Input)
	fmt.Println(tyomi_protobuf)
	for i := 0; i < len(tyomi_protobuf.MangaBackup); i += 1 {
		fmt.Println(tyomi_protobuf.MangaBackup[i].Title)
	}
}
