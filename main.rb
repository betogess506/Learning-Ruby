def n_times(thing)
  lambda {|n| puts "first called"; thing * n}  
  lambda {|n| puts "second called"; thing - n}
end

test = n_times(2)
puts test.call(3)