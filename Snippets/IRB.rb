stop = false
until stop
  puts "Enter an expression: "
  i = gets.chomp
  if i == "!"
    stop = true
  else
    eval("puts #{i}")
  end
end
