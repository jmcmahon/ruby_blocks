number = 100
temp = Math::PI / 4

# this temp is not the same as that defined outside of the block
3.times do |number; temp|
  name = "Moe"
  temp = 98.6 # we're not changing the variable defined outside block
  puts "#{number} Howdy, #{name} is #{temp}!"
end

puts "#{temp}"
