package main

import (
	"fmt"
	"os"
	"strings"
)

func un() int {
	res, _ := os.ReadFile("./input.txt")
	wholefile := string(res)
	lines := strings.Split(wholefile, "\n")

	fmt.Println(lines)

	return 0
}
