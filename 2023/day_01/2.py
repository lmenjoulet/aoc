import re

numbers = [
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine"
]

possibilities = f"({'|'.join(numbers)}|[0-9])"
find_first = re.compile(".*?" + possibilities + ".*")
find_last  = re.compile(".*" + possibilities + ".*?")

with open('./input.txt') as file:
    lines = file.readlines()
    for line in lines:
        fst = re.match(find_first, line).group(1)
        lst = re.match(find_last, line).group(1)
        if len(fst) > 1 :
            fst = numbers.index(fst)
        if len(lst) > 1 :
            lst = numbers.index(lst)
        print(int(f"{fst}{lst}"))
