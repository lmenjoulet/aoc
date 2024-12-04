#!/usr/bin/env julia 

text = read("input.txt", String)
lines = split(text, "\n")[1:end-1]

text_arr = collect(join(lines))

magicword = "XMAS"
possible = (collect(magicword), collect(reverse(magicword)))

matriced = permutedims(reshape(collect(join(lines)), (length(lines), :)))

total = 0
for idx in 1:(length(lines))
  for idy in 1:(length(lines[1]))
    to_check = [
    ]
    
    if idy <= length(lines[1]) - 3 
      to_check = push!(to_check,matriced[idx, idy:idy+3]) # top row
    end

    if idx <= length(lines) - 3
      to_check = push!(to_check,matriced[idx:idx+3, idy]) # left col
    end

    if idx <= length(lines) - 3 && idy <= length(lines[1]) - 3 
      to_check = push!(to_check,map(i -> matriced[idx+i, idy+i], 0:3)) # ltr diag
      to_check = push!(to_check,map(i -> matriced[idx+3-i, idy+i], 0:3)) # rtl diag
    end
    if idx == length(lines) - 3
      #to_check = push!(to_check, matriced[idx+3, idy:idy+3]) # bottom line
    end
    global total += count(el -> el == possible[1] || el == possible[2], to_check)
  end
end


println(total)
