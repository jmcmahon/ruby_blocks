weekdays = [ "monday", "tuesday", "wednesday", "thursday", "friday" ]


weekdays.each do |day|
  puts day.capitalize
end

weekdays.each { |d| puts d.capitalize }
