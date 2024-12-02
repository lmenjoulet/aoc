#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

cols = eachrow(
    reshape(
      vcat(map(
        line -> map(n -> parse(Int, n), split(line)), 
        lines)...),
      (2,:)))

ammount = Dict{Int,Int}()

map(x -> haskey(ammount,x) ? ammount[x] += 1 : ammount[x] = 1, cols[2])

total = 0
map(x -> if (haskey(ammount,x)) global total += ammount[x]*x end, cols[1])
println(total)
