class Sensor
  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end
end


sensor = Sensor.new


def with_checking(description)
  puts "Checking #{description}..."
  result = yield
  if result 
    puts "OK"
  else
    puts "FAILED!"
  end
end


puts "calling with_checking with temperature"
with_checking("temperature") { sensor.temperature < 150 }
puts "calling with_checking with level"
with_checking("level") { sensor.level > 3 }


puts "Checking water temperature..."
result = sensor.temperature < 150

if result
  puts "OK"
else
  puts "FAILED!"
end

# we also do something similar for water level

puts "Checking water level..."
result = sensor.level > 3
if result 
  puts "OK"
else
  puts "FAILED!"
end