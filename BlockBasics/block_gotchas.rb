number = 100
temp = Math::PI / 4

# this temp is not the same as that defined outside of the block
3.times do |number; temp| # block parameters like number are not shared with variables with same name outside of block
  name = "Moe"   # name is local to the block; not accessible outside this block
  temp = 98.6 # we're not changing the variable defined outside block
  puts "#{number} Howdy, #{name} is #{temp}!"
end

puts "#{temp}"  # will match temp from line 2
