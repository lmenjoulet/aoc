package main

import (
	"os"
	"regexp"
	"strconv"
	"strings"
)

func un() int {
	res, _ := os.ReadFile("./input.txt")
	wholefile := string(res)
	lines := strings.Split(wholefile, "\n")

	sum := 0
	for _, line := range lines {
		if len(line) > 0 {
			filter, _ := regexp.Compile(`[0-9]`)
			filtered := filter.FindAllString(line, -1)
			fst, _ := strconv.Atoi(filtered[0])
			lst, _ := strconv.Atoi(filtered[len(filtered)-1])

			sum += fst*10 + lst
		}
	}

	return sum
}
