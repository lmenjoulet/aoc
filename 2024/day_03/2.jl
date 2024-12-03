#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

text = join(lines)

validparts = split(text,r"don't\(\).*?do\(\)")
println(sum(map(x -> sum([prod(map(y -> parse(Int,y), match.captures)) for match in eachmatch(r"mul\((\d+),(\d+)\)", x)]), validparts)))

