package main

import (
	"fmt"

	"github.com/croisen/chiyo-tatsu/utils/args"
	"github.com/croisen/chiyo-tatsu/utils/chiyototatsu"
	"github.com/croisen/chiyo-tatsu/utils/kotatsu_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_gunzip"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_pbone"
)

func main() {
	arg := args.CreateArgs()

	fmt.Println("Input File: ", *arg.Input)
	fmt.Println("Ref File:   ", *arg.Reference)
	fmt.Println("Source File:", *arg.Source)
	fmt.Print("Output File:", *arg.Output, "\n\n")

	tBackup := tachiyomi_gunzip.TGunZip(*arg.Input)
	kBackup := kotatsu_backups.ReadReference(*arg.Reference)
	sources := tachiyomi_pbone.ReadTachiyomiSources(*arg.Source)
	kBackup = chiyototatsu.Chiyototatsu(tBackup, kBackup, sources)
	kotatsu_backups.SaveToFile(*arg.Output, kBackup)
}
