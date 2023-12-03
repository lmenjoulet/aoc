#!/usr/bin/env python3

import re

with open('./input.txt') as file:
    lines = file.readlines()
    for line in lines:
        line = line.rstrip("\n")

    sum = 0
    for l_idx, line in enumerate(lines):
        for foundnum in re.finditer("[0-9]+",line):
            b,e = foundnum.span()
            truenum = int(line[b:e])
            if b > 0 : b = b - 1
            if e < len(line) -1 : e = e + 1
            pre = ""
            post = ""
            if line is not lines[0]: pre = lines[l_idx-1][b:e]
            if line is not lines[-1]: post = lines[l_idx+1][b:e]
          
            surroundings = f"{pre}{line[b:e]}{post}"
            if re.search("[^\.\d]", surroundings): sum += truenum
    print(sum) 
