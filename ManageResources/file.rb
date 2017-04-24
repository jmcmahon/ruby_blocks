f = File.open("letter.txt", "w")
f.puts "Hello!"
f.puts "Goodbye."
f.close

f = File.open("letter.txt", "r")
f.each { |line| puts line }
f.close

File.open("letter2.txt", "w") do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end


File.open("letter2.txt", "r") do |f|
  f.each { |line| puts line }
end




class File
  def self.my_open(filename, mode)
    file = self.new(filename, mode)

    return file unless block_given?
    begin
      yield(file)
    ensure
      file.close
    end
  end
end

File.my_open("letter.txt", "w") do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end

File.my_open("letter.txt", "r") do |f|
  f.each { |line| puts line }
end

f = File.my_open("letter.txt", "w")
f.puts "Hello!"
f.puts "Goodbye."
f.close
