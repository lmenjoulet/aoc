#!/usr/bin/env julia 

lines = []

open("./input.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

lines = map(line -> map(n -> parse(Int,n), split(line)), lines)

check_safe = map(line -> reduce(function((x, sign, check),y) 
    if x == -1 return (y, 0, true) end
    if check == false return (x, sign, check) end

    diff = y-x
    if abs(diff) < 1 || abs(diff) > 3 
      return (x, sign, false)
    end
   
    if sign == 0
      return (y, diff/abs(diff), true)
    end

    if sign != diff/abs(diff)
      return (x, sign, false)
    end

    return (y, diff/abs(diff), true)
  end, line, init=(-1, 0, true)), lines)

check_safe = map(check -> check[3], check_safe)

println(sum(check_safe))
