puts "Let's start mastering Ruby blocks!"

3.times do 
  puts "Echo!"
end

# block attached to the method call; it's not a parameter
3.times() do
  puts "Hello"
end

# single line block
3.times() { puts "curly"}

3.times { puts "single line" }


class Order
  attr_reader :email, :total

  def initialize(email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{email}: $#{total}"
  end
end

orders = []

5.times do
  orders << Order.new("customer@example.com", 10)
end 

puts orders

3.times { |number| puts "#{number} Echo!" }

3.times do |number|
  puts "#{number} Hello"
end

orders = []
5.times do |n|
  orders << Order.new("customer#{n}@example.com", 10 * n)
end

puts orders


1.upto(3) { |n| puts "#{n} Echo!"}

orders = []
1.upto(5) do |n|
  orders << Order.new("customer#{n}@example.com", 10 * n)
end

puts orders

