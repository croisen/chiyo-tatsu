package main

import (
	"fmt"

	"github.com/croisen/chiyo-tatsu/utils/args"
	"github.com/croisen/chiyo-tatsu/utils/chiyototatsu"
	"github.com/croisen/chiyo-tatsu/utils/kotatsu_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_gunzip"
)

func main() {
	arg := args.CreateArgs()

	fmt.Println("Input File: ", *arg.Input)
	fmt.Println("Ref File:   ", *arg.Reference)
	fmt.Println("Output File:", *arg.Output, "\n")
	tBackup := tachiyomi_gunzip.TGunZip(*arg.Input)
	kBackup := kotatsu_backups.ReadReference(*arg.Reference)
	kBackup = chiyototatsu.Chiyototatsu(tBackup, kBackup)
	kotatsu_backups.SaveToFile(*arg.Output, kBackup)
}
