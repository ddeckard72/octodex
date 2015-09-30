# destutterer
somenumbers = Array[1,3,4,4,6,7,2,2,3,3,4,8,8,9,8]

puts somenumbers.inspect

(somenumbers.size - 1).downto(1) { |i| somenumbers[i] = nil if somenumbers[i - 1] == somenumbers[i] }
somenumbers.compact!
puts somenumbers.inspect
