3.times do
  puts "Running block!"
end

def run_my_block
  puts "Starting method..."
  yield
  puts "Back in method..."
end

run_my_block do
  puts "Running my block!"
end

def roll(times)
  puts "Starting method..."
  1.upto(times) { yield if block_given? }
  puts "Back in method..."
end

  
roll(5) do
  number = rand(1..6)
  puts "You rolled a #{number}"
end

roll(4) # no block so will not yield

def roll_larry
  number = rand(1..6)
  puts "Starting method..."
  yield "Larry", number if block_given? # Larry will be a block parameter
  puts "Back in method..."
end

roll_larry do |name, number|
  puts "#{name} rolled a #{number}"
end

roll_larry


def roll
  number = rand(1..6)
  result = yield "Larry", number
  puts "The block returned #{result}"
end

roll do |name, number|
  puts "#{name} rolled a #{number}!"
  number * 2   # the last command is the return value of the block
  # puts "Hello"  gotcha since puts returns nil
end
