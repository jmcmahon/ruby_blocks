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

class MovieQueue
  include Enumerable
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  # you want an each to unlock all the enumerable methods, like select
  # but to get select, we need to include the enumerable module
  # select defined in enumerable module.  enumerable defined in Array class
  # but we need to add it to our MovieQueue class to use select
  def each
    @movies.each { |movie| yield movie }
  end

  # add debugging info to each
 # def each
 #   @movies.each do |movie|
 #     puts "Yielding #{movie.title} from each method"
 #     yield movie   
 #   end
 # end

  def each_pg_movie
    @movies.select { |m| m.rating == "PG" }.each { |m| yield m }
  end

  def each_by_rating(rating)
    @movies.select { |m| m.rating == rating }.each { |m| yield m }
  end

end

queue = MovieQueue.new ("Friday Night")

queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)


queue.each { |movie| movie.watch }

puts "watching PG movies"
queue.each_pg_movie { |movie| movie.watch }

puts "watching G movies"
queue.each_by_rating("G") { |movie| movie.watch }

puts "long movies"
# we have to define an each method and include Enumerable in our MovieQueue class
# for select to work (defined in Enumerable class), select depends on each method
# if each not defined, will get an undefined method each error
long_movies = queue.select { |m| m.duration > 100 }
p long_movies


puts "see if you can find Apollo 13 movie"
# find first movie that is Apollo 13
apollo_movie = queue.detect { | movie | movie.title == "Apollo 13" }

p apollo_movie


puts "see if you can find Apollo 13 movie using regular expression"
# find first movie that is Apollo 13
# NOTE: no quotes around the regular expression
p queue.detect { | movie | movie.title =~ /13/ }


