# the examples here are like methods in Ruby that open files.



class PaymentGateway
  def initialize(user, password)
    @user = user
    @password = password
  end

  def connect
    # connects to remote service
    puts "Connected as #{@user}"
  end

  def disconnect
    # disconnects from remote service
    puts "Disconnected #{@user}!"
  end

  # submit transactions
  def submit(type, amount)
    # submits request to remote service
    puts "Submitted #{type} for #{amount}."
  end

  # we don't have a PaymentGateway object yet, so we need to create a class method using self.methodname
  # and change name of the method to just open

  # we can call with or without a block
  # common pattern for handling resources
  def self.open(user, password)
    #    gateway = PaymentGateway.new(user, password)
    # we can change the object to self here, since it refers to the class we're in
    gateway = self.new(user, password)
    gateway.connect

    # the trick here if a block isn't given is this
    return gateway unless block_given?



    # makes sure the ensure only applies to this block (one with yield)
    # we already know that the connection is ok
    # and rescue only applies to the yield exceptions
    begin
      yield(gateway)
    rescue Exception => e
      puts e.message
    ensure
      gateway.disconnect
    end
  end

end

def standalone_open_gateway(user, password)
  gateway = PaymentGateway.new(user, password)
  gateway.connect
  yield(gateway)
  gateway.disconnect
end



# what if we want to have fine-grain control over the object
# we can not pass a block and return the object and then call the methods themselves
puts "manual control without block"
gateway = PaymentGateway.open("nicole", "secret")
gateway.submit(:void, 15.00)
gateway.disconnect


# Calling the class method
puts "run with Class method PaymentGateway"
PaymentGateway.open("nicole", "secret") do |gateway|
  gateway.submit(:sale, 12.00)
  gateway.submit(:sale, 10.00)
end

# Calling the class method
puts "run with Class method PaymentGateway with refund in block"
PaymentGateway.open("nicole", "secret") do |gateway|
  gateway.submit(:refund, 5.00)
  gateway.submit(:refund, 20.00)
  raise "Problem!"
end


puts "run with block standalone_open_gateway"
standalone_open_gateway("nicole", "secret") do |gateway|
  gateway.submit(:sale, 12.00)
  gateway.submit(:sale, 10.00)
end

gateway = PaymentGateway.new("nicole", "secret")

gateway.connect

gateway.submit(:sale, 12.00)

gateway.submit(:sale, 10.00)

gateway.disconnect

gateway = PaymentGateway.new("nicole", "secret")

gateway.connect

gateway.submit(:refund, 5.00)

gateway.submit(:refund, 20.00)

gateway.disconnect
