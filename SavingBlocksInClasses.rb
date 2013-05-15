#Saving a block in a method.
class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end

  def get_tax(amt)
    "#{@name} on #{amt} = #{@block.call(amt)}"
  end
end

tc = TaxCalculator.new("Sales Tax") {|x| x * 0.075}

puts tc.get_tax 100
puts tc.get_tax 250