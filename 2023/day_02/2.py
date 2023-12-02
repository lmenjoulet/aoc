#!/usr/bin/env python3

import re


# games structure :
# {
#   1: [ { red: x, green: y,blue: z }, ...],
#   ...
# }
games = { }

with open('./input.txt') as file:
    lines = file.readlines()
    parsegame = "^Game ([0-9]+):(.*)$"
    parser = re.compile(parsegame)
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
    minrequired = { 'red': 0, 'green': 0, 'blue': 0}
    for play in plays:
        for color in minrequired:
            if play[color] > minrequired[color] : 
                minrequired[color] = play[color]
    power = 1
    for x in minrequired.values():
        power = power * x
    sum+=power
        
print(sum)
