class Genres
  def initialize
    @names = ["Action", "Comedy", "Sci-Fi", "Adventure"]
  end

  # we want to use each but we are one object removed from the Array class
  # so we'll define our own each method for the Genres class
  # will piggy back on the each method from the Array class
  def each
    @names.each { |name| yield name }
  end
end

genres = Genres.new

genres.each { |name| puts name }