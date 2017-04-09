class Order
  TAX_TABLE = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }

  attr_reader :email, :total, :state, :status

  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
  end

  def tax 
    total * TAX_TABLE[state]
  end

  def to_s
    "#{email} (#{state}): $#{total} - #{status}"
  end
end

orders = []

orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)


puts orders

puts "Big orders:"
# returns a new array
big_orders = orders.select { |o| o.total >= 300 }
puts big_orders


# there is a slight difference from using curly braces for your block vs. do and end
# example

puts orders.select { |o| o.total >= 200 }  # works because curly braces bind tighter 
# than do and end

# but this will return back an enumerator

# Gotcha
# prints out #<Enumerator:0x007fc1db05d468>
puts orders.select do |o|
  o.total >= 300
end

# above is equivalent to, which is not what we want
# select without a block returns an enumerator
puts(orders.select) do |o|
  o.total >= 300
end

# from man pages
# select { |item| block } -> new_ary
# select -> Enumerator   (no block)



# this works fine though
large_orders = orders.select do |o|
  o.total >= 300
end
puts large_orders


puts "Small orders"
puts orders.reject { |o| o.total >= 300 }  # reject is the opposite of select


puts orders.any? { |o| o.status == :pending }


# print out the first order that's pending; same as find
puts orders.detect { |o| o.status == :pending } 

# the Array and Hash classes 
# include Enumerable module (or mix-in Enumerable)
# that's why they can use these methods

results = orders.partition { |o| o.status == :pending }
p results  # shows internal representation of the array


pending_orders, completed_orders = orders.partition { |o| o.status == :pending }

puts pending_orders
puts completed_orders


big_orders, small_orders = orders.partition { |o| o.total >= 300 }

puts "big orders"
puts big_orders

puts "small orders"
puts small_orders


puts "Newsletter emails"
# fyi, the returned array is always the same size as the original array
emails = orders.map { |o| o.email.downcase }
p emails


# gotcha.  puts returns nil, so this brings back array of nils. 
puts "Newsletter emails"
emails = orders.map { |o| puts o.email.downcase } #  Don't want puts here
p emails


puts "Taxes:"
co_orders = orders.select { |o| o.state == "CO" }
co_taxes = co_orders.map { |o| o.tax }
p co_taxes

# better to string map on to get the same as above

co_taxes = orders.select { |o| o.state == "CO" }.map { |o| o.tax }
p co_taxes

puts "order total"
puts orders.reduce(0) {|sum, order| sum + order.total }

puts "total tax"
puts orders.reduce(0) {|total, order| total + order.tax }

# another way to write above using map and reduce
puts "total tax"
puts orders.map {|o| o.tax }.reduce(:+)
