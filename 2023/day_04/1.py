#!/usr/bin/env python3

with open('./input.txt') as file:
    lines = file.readlines()
    sum = 0
    for idx in range(len(lines)):
        lines[idx] = lines[idx].rstrip("\n")
        win, got = lines[idx].split(":")[1].split("|")
        win = list(filter(lambda x: x != "", win.split(" ")))
        got = list(filter(lambda x: x != "", got.split(" ")))
        sum = sum + int(pow(2,len(set(win).intersection(set(got))) - 1) // 1)

print(sum)

        
