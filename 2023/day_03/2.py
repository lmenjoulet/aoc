#!/usr/bin/env python3

import re

"""
Data structure: 

gears = {
    (line, col) = [numbers]
}
"""

gears = {}
with open('./input.txt') as file:
    lines = file.readlines()
    for idx in range(len(lines)):
        lines[idx] = lines[idx].rstrip("\n")
    sum = 0
    for row_line, line in enumerate(lines):
        for foundnum in re.finditer("[0-9]+",line):
            b,e = foundnum.span()
            truenum = int(line[b:e])

            fst_line = row_line 
            if row_line > 0 : fst_line = row_line - 1 

            lst_line = row_line
            if row_line < len(lines) - 1: lst_line = row_line + 1

            fst_char = b
            if b > 0: fst_char = b - 1
            lst_char = e
            if e < len(line) - 1 : lst_char = e + 1

            for row in range(fst_line, lst_line + 1):
                for local_pos, char in enumerate(lines[row][fst_char:lst_char]):
                    if char == "*" : 
                        gears.setdefault((row, local_pos + fst_char), [])
                        gears[(row, local_pos + fst_char)].append(truenum)
sum = 0
for nums in gears.values():
    if len(nums) == 2: 
        sum += nums[0]*nums[1]

print(sum)
