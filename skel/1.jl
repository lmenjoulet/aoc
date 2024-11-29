#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,strip(line,"\n"))
  end
end
