#!/usr/bin/env python3

sections = {}
seeds = []
with open('./input.txt') as file:
    raw = file.read()
    section_split = list(map(
        lambda x: x.split("\n"),
        raw.split("\n\n")))

    section_split[0] = section_split[0][0].split(": ")
    seeds = [int(val) for val in section_split[0][1].split(" ")]

    for section_butchered in section_split[1:]:
        section_code = section_butchered[0].rstrip(" map:")
        sections[section_code] = list(map(
            lambda x: tuple(int(val) for val in x.split(" ") if val),
            section_butchered[1:]))

sections["humidity-to-location"].pop()

destinations = []
for seed in seeds:
    target = seed
    for name, maps in sections.items():
        for dest_start, source_start, map_length in maps:
            if target >= source_start and target < source_start + map_length:
                target = target - source_start + dest_start
                break

    destinations.append(target)
print(min(destinations))
