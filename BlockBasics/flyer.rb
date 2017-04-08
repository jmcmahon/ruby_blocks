class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

f_array = []
1.upto(5) do |n|
  f_array << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000 )
end

puts f_array