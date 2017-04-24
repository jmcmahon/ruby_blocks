start_time = Time.now

# run some code   Chunk of code in the middle we want to run, sandwiched between boilerplate code that brackets that doesn't change.
sleep (0.5)

elapsed_time = Time.now - start_time
puts "It took #{elapsed_time} seconds"


# you end up with lots of duplicated code when written like this ^
# so let's create a method to encapsulate this and call it using a block

# sometimes called execute around

def time_it(label)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{label} took #{elapsed_time} seconds"
end


# sometimes called execute around
time_it("Sleepy code") do
  # run some code
  sleep(0.5)
end

