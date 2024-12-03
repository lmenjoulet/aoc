#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

text = join(lines)

test = sum([prod(map(x -> parse(Int,x), match.captures)) for match in eachmatch(r"mul\((\d+),(\d+)\)", text)])

println(test)
