#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

cols = map(x -> sort(x),
  eachrow(
    reshape(
      vcat(map(
        line -> map(n -> parse(Int, n), split(line)), 
        lines)...),
      (2,:))))

println(sum([abs(pair[1]-pair[2]) for pair in zip(cols[1], cols[2])]))
