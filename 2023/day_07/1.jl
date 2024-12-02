#!/usr/bin/env julia 

lines = []

open("./example_1.txt") do file
  for line in eachline(file)
    push!(lines,line)
  end
end

lines = map(split, lines)
lines = map(line -> (line[1], parse(Int, line[2])), lines)

hand_types = Dict([
  ([1,1,1,1,1],0),  # high card
  ([2,1,1,1,],1),   # one pair
  ([2,2,1],2),      # two pair
  ([3,1,1],3),      # three of a kind
  ([3,2],4),        # full house
  ([4,1], 5),       # four of a kind
  ([5],6)           # five of a kind
])

typed_hands = map(
  function(line)
    line..., hand_types[sort(map(
        item -> count(el -> el == item, line[1]),
      collect(Set(line[1]))),
      rev=true)]
  end, lines)

grouped_hands = Dict{Int64,Array{Tuple{String,Int64}}}()
map(function(hand)
    if !haskey(grouped_hands,hand[3])
      grouped_hands[hand[3]] = []
    end
    push!(grouped_hands[hand[3]],(hand[1],hand[2]))
  end,
  typed_hands)

println(grouped_hands)
