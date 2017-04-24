spec = Gem::Specification.new do |s|
  s.name        = 'my-gem'
  s.version     = '2.0.0'
  s.summary     = "This is a cool gem!"
  s.description = "Much longer explanation of my cool gem."
  s.licenses    = ['MIT']
  s.author      = ["Ruby Coder"] 
  s.email       = 'rubycoder@example.com'
  s.summary     = "This is a cool gem!"
  s.files       = ["lib/example.rb"]
  s.homepage    = 'https://rubygems.org/gems/example'
end

puts spec

module Jem
  class Specification
    attr_accessor :name, :version, :summary

    def initialize
      @version = '1.0.0'  # default
      yield(self) if block_given?
    end
  end
end

# write our own version of Gem::Specification
spec = Jem::Specification.new do |s|
  s.name        = 'my-gem'
  s.version     = '2.0.0'
  s.summary     = "This is a cool gem!"
end

p spec

puts spec.version


# example where we don't specify a block
spec = Jem::Specification.new
spec.name = "Mike"

p spec

# whether you specify a block or not is a stylistic decision