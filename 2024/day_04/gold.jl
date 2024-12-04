#!/usr/bin/env julia 

text = read("input.txt", String)
lines = split(text, "\n")[1:end-1]

text_arr = collect(join(lines))

magicrect = r"M.S.A.M.S"

matriced = permutedims(reshape(collect(join(lines)), (length(lines), :)))

total = 0
for idx in 1:(length(lines) - 2)
  for idy in 1:(length(lines[1]) - 2)
    tempmat = matriced[idx:idx+2,idy:idy+2] 
    for rot in 0:3
      tempmat = rotr90(tempmat)
      if match(magicrect, join(tempmat)) !== nothing
        global total+= 1
        break
      end
    end
  end
end


println(total)
