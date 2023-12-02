#!/usr/bin/env python3

import re

expression = "^Game ([0-9]+):(.*)$"
parser = re.compile(expression)

games = { }

# games structure :
# {
#   1: [ { red: x, green: y,blue: z }, ...],
#   ...
# }

maxcolors = { 'red': 12, 'green': 13, 'blue':14 }

with open('./input.txt') as file:
    lines = file.readlines()
    for line in lines:
        game, results = parser.match(line).groups()
        sequences = []
        for seq in results.split(";"): # sequence
            sequence = { "red": 0, "green": 0, "blue": 0}
            for color in seq.split(","): # ball ammount
                scorecolor = re.match(" ([0-9]+) (red|green|blue)", color).groups()
                sequence[scorecolor[1]] = int(scorecolor[0])
            sequences += [sequence]
        games[int(game)] = sequences

sum = 0
for game, plays in games.items():
    valid = True
    for play in plays:
        for color in maxcolors:
            if play[color] > maxcolors[color] : valid = False
    if valid : sum += int(game)

print(sum)
