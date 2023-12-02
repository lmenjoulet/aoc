#!/usr/bin/env python3

with open('./input.txt') as file:
    lines = file.readlines()
    sum = 0
    for line in lines: 
        filtered = []
        for char in line:
            if char in "0123456789":
                filtered.append(int(char))
        sum += filtered[0]*10 + filtered[-1]
    print(sum)
