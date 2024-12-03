#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines, line)
  end
end

lines = map(line -> map(n -> parse(Int, n), split(line)), lines)

safe(arr) = (reduce(function ((safe, sign, x), y)
      if safe == false
        return (false, 0, 0)
      end
      if x == -1
        return (true, 0, y)
      end
      diff = y - x
      if abs(diff) < 1 || abs(diff) > 3
        return (false, 0, 0)
      end
      if sign == 0
        return (true, diff / abs(diff), y)
      end
      if diff / abs(diff) != sign
        return (false, sign, y)
      end
      return (true, sign, y)
    end,
    arr, init=(true, 0, -1))[1], arr)

combinations(arr) = map(i -> vcat(arr[begin:i-1], arr[i+1:end]), 1:length(arr))


firstpass = map(line -> safe(line), lines)
badones = map(failres -> failres[2], filter(pass -> pass[1] == 0, firstpass))

first_res = count(res -> res[1] > 0, firstpass)
snd_res = count(res -> res > 0, map(
  line ->
    count(res -> res[1] > 0, map(combination -> safe(combination), combinations(line))),
  badones))

println(first_res+snd_res)
