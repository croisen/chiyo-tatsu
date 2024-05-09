package main

import (
	"fmt"
	"os"
	"strconv"
	"time"

	"github.com/croisen/chiyo-tatsu/utils/args"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_gunzip"
)

func main() {
	arg := args.CreateArgs()
	if arg.Input == nil {
		fmt.Println("Input file (tachiyomi backup) was not passed with -i or --input")
		os.Exit(1)
	}

	output := "kotatsu_" + strconv.Itoa(int(time.Now().UnixMilli())) + ".bk.zip"
	if arg.Output != nil && len(*arg.Output) != 0 {
		output = *arg.Output
	}

	_ = tachiyomi_gunzip.TGunZip(arg.Input)
	fmt.Println("Input File: ", *arg.Input)
	fmt.Println("Ref File:   ", *arg.Reference)
	fmt.Println("Output File:", output)
}
