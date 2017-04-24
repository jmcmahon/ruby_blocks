class Movie
  attr_reader :title, :rating, :duration

  def initialize(title, rating, duration)
    @title = title
    @rating = rating
    @duration = duration
  end

  def watch 
    puts "Watching #{title} - #{rating} (#{duration} mins)..."
  end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Cast Away", "PG", 143)
movie3 = Movie.new("Apollo 13", "PG", 140)
movie4 = Movie.new("Cars", "G", 117)


module MyEnumerable
  # select returns an array of values that match
  def my_select
    new_array = []   # so we need to create an array
    each do |value|  # then we call the each method on the object (generically)
      new_array << value if yield(value)  # add to the array only if the block returns true
    end
    new_array
  end

  # my_map is just like select, but instead of returning only values where the block is 
  # true, we return all values after the block is run
  def my_map
    new_array = []   # so we need to create an array
    each do |value|  # then we call the each method on the object (generically)
      new_array << yield(value)  # add the value from running yield 
    end
    new_array
  end

end

class MovieQueue
  include MyEnumerable

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each { |movie| yield movie }
  end
end

queue = MovieQueue.new ("Friday Night")

queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

puts "long movies"
long_movies = queue.my_select { |m| m.duration > 100 }
p long_movies

puts "downcase movie titles"
titles = queue.my_map { |m| m.title.downcase }
p titles