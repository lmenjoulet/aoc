#!/usr/bin/env python3

cards = [] 

with open('./input.txt') as file:
    lines = file.readlines()
    sum = 0
    for idx in range(len(lines)):
        lines[idx] = lines[idx].rstrip("\n")
        win, got = lines[idx].split(":")[1].split("|")
        win = list(filter(lambda x: x != "", win.split(" ")))
        got = list(filter(lambda x: x != "", got.split(" ")))
        cards.append(
            list(
                range(
                    idx + 1, 
                    idx + 1 +len(set(win).intersection(set(got)))
                )
            )
        )

def sumcards(cardlist):
    sum = len(cardlist)
    for got in cardlist:
        sum += sumcards(cards[got])
    return sum

sum = len(cards)
for card in cards:
    sum += sumcards(card)
print(sum)


