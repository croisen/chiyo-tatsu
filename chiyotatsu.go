package main

import (
	"fmt"

	"github.com/croisen/chiyo-tatsu/utils/args"
	"github.com/croisen/chiyo-tatsu/utils/kotatsu_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_gunzip"
)

func main() {
	arg := args.CreateArgs()

	fmt.Println("Input File: ", *arg.Input)
	fmt.Println("Ref File:   ", *arg.Reference)
	fmt.Println("Output File:", *arg.Output)
	_ = tachiyomi_gunzip.TGunZip(*arg.Input)
	_ = kotatsu_backups.ReadReference(*arg.Reference)

}
