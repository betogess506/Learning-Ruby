my_block = proc {|x, y| x + y}

def a_func
	yield(1, 3) if block_given?
end

puts a_func(&my_block)
