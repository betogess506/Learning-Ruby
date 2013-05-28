#Spawned question on stack overflow here: http://stackoverflow.com/questions/16785239/why-do-we-prefix-class-variables-with-in-ruby

class Test
  @var = 99
  attr_accessor :var

  def initialize
    @var = "Whoop"
  end

  def pri
    puts @var
  end

  class << self
    attr_accessor :var
  end
end

t = Test.new
puts Test.var
Test.var = 5
puts Test.var
puts t.pri
puts t.var