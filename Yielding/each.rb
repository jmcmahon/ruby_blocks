
class Array
  def each
    i = 0 
    while i < self.size
      yield self[i]
      i += 1
    end
    self
  end
end

weekdays = [ "monday", "tuesday", "wednesday", "thursday", "friday" ]
puts weekdays.each {  |day| day }.map { |day| day.upcase }