package simple_pp

import (
	"encoding/json"
	"fmt"
	"os"
)

func PretyPrint(i interface{}) string {
	s, err := json.MarshalIndent(i, "", "\t")
	if err != nil {
		fmt.Println("Cannot pretty print", i)
		fmt.Println(err)
		os.Exit(1)
	}

	fmt.Println(string(s[:]))
	return string(s[:])
}
