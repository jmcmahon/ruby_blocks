def n_times( number )
  i = 0
  while i < number
    yield i
    i += 1
  end
end

n_times(3) { |n| puts "#{n} Echo!"}

# open up the integer class
class Integer
  # basically now the times function works
  def times
   i = 0
   while i < self
     puts "Yielding #{i}..."  # so we know we are calling our times method
     yield i
     i += 1
   end
  end
end

10.times do |i|
  puts "#{i}"
end
