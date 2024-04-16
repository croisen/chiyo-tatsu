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
	// Dunno why it returns empty to my backup file just yet
	fmt.Println(tyomi_protobuf.GetMangaBackup())
}
