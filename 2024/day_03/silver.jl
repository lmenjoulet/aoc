#!/usr/bin/env julia 

text = read("input.txt", String)

clean_pairs = [map(str -> parse(Int, str), match.captures) for match in eachmatch(r"mul\((\d+),(\d+)\)", text)]
silver = sum(map(pair -> prod(pair), clean_pairs))

println(silver)
