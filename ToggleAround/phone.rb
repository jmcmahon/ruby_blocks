class Phone
  attr_accessor :airplane_mode

  def initialize
    @airplane_mode = false
  end

  def text(message)
    if @airplane_mode
      puts "Saved text: #{message}"
    else
      puts "Sent text: #{message}"
    end
  end

  def in_airplane_mode
    @airplane_mode = true
    yield
    @airplane_mode = false  # the raise will skip this line completely
                            # and will not toggle back to airplane mode = false
  rescue Exception => e    # not necessary needed, but still should have an ensure clause
    puts e.message
  ensure  # your friend in this case
    @airplane_mode = false 
    puts "mode is now #{@airplane_mode}"
  end
end

phone = Phone.new


phone.airplane_mode = true
phone.text("Just took off")
phone.text("At 30,000 ft!")
phone.airplane_mode = false


phone.text("Just landed!")


phone.in_airplane_mode do
  phone.text("Just took off!")
  phone.text("At 30,000 ft!")
  # we could do anything here, like call or email, if those methods existed
  # phone.email("just did something")
  # phone.call("Just did call")
  raise "Whoops"
end

phone.text("Just landed!")
