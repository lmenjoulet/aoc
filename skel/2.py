#!/usr/bin/env python3

with open('./input.txt') as file:
    lines = file.readlines()
    for idx in range(len(lines)):
        lines[idx] = lines[idx].rstrip("\n")

