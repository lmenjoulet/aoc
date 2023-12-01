package main

import (
	"os"
	"regexp"
	"strconv"
	"strings"
)

func deux() int {

	digits := make(map[string]int)

	digits["zero"] = 0
	digits["one"] = 1
	digits["two"] = 2
	digits["three"] = 3
	digits["four"] = 4
	digits["five"] = 5
	digits["six"] = 6
	digits["seven"] = 7
	digits["eight"] = 8
	digits["nine"] = 9

	res, _ := os.ReadFile("./input.txt")
	wholefile := string(res)
	lines := strings.Split(wholefile, "\n")

	sum := 0
	for _, line := range lines {
		if len(line) > 0 {
			fst_filter, _ := regexp.Compile(`(one|two|three|four|five|six|seven|eight|nine|[0-9]).*`)
			lst_filter, _ := regexp.Compile(`.*(one|two|three|four|five|six|seven|eight|nine|[0-9])`)
			fst := fst_filter.FindStringSubmatch(line)
			lst := lst_filter.FindStringSubmatch(line)

			pair := [2]int{}

			for idx, numstr := range []string{fst[1], lst[1]} {
				if len(numstr) > 1 {
					pair[idx], _ = digits[numstr]
				} else {
					pair[idx], _ = strconv.Atoi(numstr)
				}
			}
			sum += pair[0]*10 + pair[1]
		}
	}

	return sum
}
