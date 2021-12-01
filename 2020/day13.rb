schedule = "23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,647,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,x,x,x,x,x,x,29,x,557,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17"
# $arrival = 1006726

# schedule = "7,13,x,x,59,x,31,19"
$arrival = 939

buses = schedule.chomp.split(",").map &:to_i

def bus_wait(bus)
  bus - ($arrival % bus)
end

sorted = buses.select { |i| i > 0 }.sort_by { |i| bus_wait(i) }
p sorted[0] * bus_wait(sorted[0])
