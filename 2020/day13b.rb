
schedule = "23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,647,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,x,x,x,x,x,x,29,x,557,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17"
# $arrival = 1006726

# schedule = "7,13,x,x,59,x,31,19"
$arrival = 939



buses = schedule.chomp.split(",").map &:to_i

bus_defs = buses.each_with_index.select{|k,v| k > 0}.sort {|a,b| a[0] <=> b[0]}.reverse
bus_defs.map { |k,v| }
p bus_defs


ts = bus_defs[0][1]
multiplier = bus_defs[0][0]

bus_defs.shift
bus_defs.each do |bus|
  while ts % bus[0] != bus[1]
end

#
# def bus_matches(bus, index, arrival)
#   a = bus - (arrival % bus)
#   if a == bus
#     0 == index
#   else
#     a == index
#   end
# end
#
#
#
#
# multiplier = 647
# ts = (multiplier * 557) - 23
# while true
#   i = 0
#   num_matched = 0
#   until i == bus_defs.length
#     if bus_matches(bus_defs[i][0], bus_defs[i][1], ts)
#       num_matched = num_matched + 1
#     else
#       break
#     end
#   end
#
#   if num_matched == bus_defs.length
#     p ts
#     exit(0)
#   end
# #
# #   if num_matched == 2
# #     multiplier = 360379
# #     p "found a match for first 2"
# #   end
# #
#   ts = ts + multiplier
# #
# #
# end
