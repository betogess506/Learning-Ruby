#this is just a "play" file to wrap my head around how classes work in Ruby.
module TestModule
  A_CONSTANT = 5
  attr_reader :c_var
  @int_var = "int_var"
  @@c_var = "c_var"


  def sub_numbers(n2, n3)
    n2 - n3
  end

  def self.prints(m)
    puts m
  end
end

class InheritMe
  def initialize
    @inherited = true
  end

  def self.wiggle
    puts "Wiggle"
  end

  def inherited? #instance method
    puts "bleh"
    return @inherited
  end
end

#puts InheritMe.inherited? Error as expected
puts InheritMe.new.inherited?, ' ' #true

class RandomStuff < InheritMe
  include TestModule
  attr_reader :instance_var, :cla_var
  @instance_var
  @@cla_var
  def initialize
    #@instance_var = 5 commmented to see if access_instance_variable will return if declared outside initialize
    super() #initialize Inheritme
  end

  def self.add_numbers(n1, n2)
    return n1 + n2
  end

  def self.access_instance_variable
    return @instance_var
  end

  def print_message(m)
    puts m
  end
end

puts RandomStuff.add_numbers(1, 2) #Works! Huzzah, so using self wont require the creation of an instance.
puts RandomStuff.access_instance_variable #returns nothing when instance var declared in initialize. Works if declared outside of it.
#puts RandomStuff.instance_var #doesnt work.
#puts RandomStuff.print_message("testmsg"); #doesnt work as expeted
#check if it inherited properly.
RandomStuff.wiggle #works,
puts "\n"

i = RandomStuff.new
#puts i.add_numbers(1, 2) #doesnt work, cant use class methods when instantiated.
i.print_message("Test")
puts i.inherited?
puts ("=" * 20) + "\n" #sepearte class tests from mixin tests.
puts TestModule::A_CONSTANT #works
#puts TestModule::@int_var #no luck
#puts TestModule::c_var #no luck
#puts TestModule::sub_numbers(3, 2) #doesnt work?
puts TestModule::prints("writgssdf") #works, 
#Scope resolution (::) only works for class methods and constants.
#puts TestModule.c_var 
#puts TestModule.prints("auela") #doesnt work, but :: does...
puts i.sub_numbers(4, 1) #test mixin
#puts RandomStuff.prints("Enddd") #test mixin, doesnt work
#puts RandomStuff::prints("ennnndd") #no idea why it doesnt work.
