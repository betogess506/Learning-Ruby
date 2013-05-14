module Observers
  attr_accessor :observers_list
  def observers
    @observers_list ||= []
  end

  def add_observer(obs)
    observers << obs
  end
end

class Telescope
  attr_accessor :observers_list
  include Observers

  def initialize
    @observers_list = []
  end

  def add_viewer(vi)
    @observers_list << vi
  end
  #....
end


test = Telescope.new
test.add_viewer("test viewer")
puts test.observers_list
test.add_observer("Test observer");
puts test.observers_list

=begin
Must note to myself to be careful of what just happened above. Good practice to name methods in modules after the module themselves.
otherwise it's potentially possible that a class and a module can share the same variable with NO error messages.
This would seem impossible to detect if this problem actually occured.
=end