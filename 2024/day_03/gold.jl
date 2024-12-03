#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines, line)
  end
end

text = join(lines)

do_enabled = join(split(text, r"don't\(\).*?do\(\)"), "a") # insert trash character to avoid potential "mul(1don't()do(),1)"
clean_pairs = [map(str -> parse(Int, str), match.captures) for match in eachmatch(r"mul\((\d+),(\d+)\)", do_enabled)]

gold = sum(map(pair -> prod(pair), clean_pairs))

println(gold)
