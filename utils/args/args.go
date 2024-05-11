package args

import (
	"fmt"
	"os"
	"time"

	"github.com/akamensky/argparse"
)

type ChiyoTatsuArgs struct {
	Input     *string
	Output    *string
	Reference *string
}

func CreateArgs() *ChiyoTatsuArgs {
	parser := argparse.NewParser("chiyotatsu", "Converts your tachiyomi backup file into a kotatsu backup file")
	input := parser.String("i", "input", &argparse.Options{Required: true, Help: "Tachiyomi backup file"})
	output := parser.String("o", "output", &argparse.Options{Required: false, Help: "Kotatsu backup file"})
	reference := parser.String("r", "reference", &argparse.Options{Required: true, Help: "Kotatsu backup file"})

	err := parser.Parse(os.Args)
	if err != nil {
		fmt.Print(parser.Usage(err))
		os.Exit(1)
	}

	date := time.Now()
	day := fmt.Sprintf("%02d", date.Day())
	month := fmt.Sprintf("%02d", date.Month())
	year := fmt.Sprintf("%04d", date.Year())
	if output == nil || len(*output) == 0 {
		output1 := "kotatsu_" + day + month + year + ".bk.zip"
		output = &output1
	}

	args := ChiyoTatsuArgs{
		Input:     input,
		Output:    output,
		Reference: reference,
	}

	return &args
}
