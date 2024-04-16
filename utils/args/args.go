package args

import (
	"fmt"
	"os"

	"github.com/akamensky/argparse"
)

type ChiyoTatsuArgs struct {
	Input  *os.File
	Output *os.File
}

func CreateArgs() *ChiyoTatsuArgs {
	parser := argparse.NewParser("chiyotatsu", "Converts your tachiyomi backup file into a kotatsu backup file")
	var args ChiyoTatsuArgs
	input := parser.String("i", "input", &argparse.Options{Required: true, Help: "Tachiyomi backup file"})
	//parser.String("o", "output", &argparse.Options{Required: true, Help: "Kotatsu backup file"})

	err := parser.Parse(os.Args)
	if err != nil {
		fmt.Print(parser.Usage(err))
		os.Exit(1)
	}

	input_file, err := os.OpenFile(*input, os.O_RDONLY, 0)
	if err != nil {
		fmt.Print(parser.Usage(nil))
		fmt.Printf("\nImproper input file %s was passed\n", *input)
		os.Exit(1)
	}

	args.Input = input_file

	return &args
}
