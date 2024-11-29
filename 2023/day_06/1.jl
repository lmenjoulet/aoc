#!/usr/bin/env julia 

lines = []

open("input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

numbers = map(x -> [parse(Int, m.match) for m in eachmatch(r"\d+", x)] , lines)
races = reshape(vcat(numbers...),(:,2))

possible_per_race = [ ]
for race in eachrow(races)
  total_time = race[1]
  best_distance = race[2]

  discriminant = total_time^2 - 4*best_distance
  x_1 = ((-total_time + discriminant^0.5)/-2)
  x_2 = ((-total_time - discriminant^0.5)/-2)
  
  if ceil(x_1) == x_1 
    x_1 = ceil(x_1)+1
  else
    x_1 = ceil(x_1)
  end

  if floor(x_2) == x_2 
    x_2 = floor(x_2)-1
  else
    x_2 = floor(x_2)
  end
  
  push!(possible_per_race, x_2 - x_1 + 1)
end

println(prod(possible_per_race))
