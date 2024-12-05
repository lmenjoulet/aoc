#!/usr/bin/env julia 

text = read("input.txt", String)
lines = split(text, "\n")[begin:end-1]

section_split_index = (findfirst(el -> el == "", lines))

rules = lines[begin:section_split_index-1]
updates = lines[section_split_index+1:end]

rules = map(el -> [parse(Int, match) for match in match(r"(\d{2})\|(\d{2})", el)], rules)
updates = map(el -> [parse(Int, match.captures[1]) for match in eachmatch(r"(\d{2})", el)], updates)

rules_dict::Dict{Int,Set{Int}} = Dict{Int,Set{Int}}()

for line in rules
  if !haskey(rules_dict, line[2])
    global rules_dict[line[2]] = Set([line[1]])
  else
    global rules_dict[line[2]] = push!(rules_dict[line[2]], line[1])
  end
end

function check_update(update, rules_dict)
  good_update = true 
  for (idx, page) in enumerate(update)
    rem_pages = Set(update[idx+1:end])
    safe_compare = if haskey(rules_dict, page)
      rules_dict[page]
    else
      Set([])
    end

    if length(intersect(rem_pages, safe_compare)) > 0
      good_update = false
      break
    end
  end
  return good_update 
end

good_updates = filter(update -> check_update(update,rules_dict), updates)

println(sum(map(update -> update[Int((end/2)+0.5)], good_updates)))
