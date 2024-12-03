#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines, line)
  end
end

text = join(lines)

clean_pairs = [map(str -> parse(Int, str), match.captures) for match in eachmatch(r"mul\((\d+),(\d+)\)", text)]
silver = sum(map(pair -> prod(pair), clean_pairs))

println(silver)
