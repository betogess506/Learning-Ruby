print "(t)imes or (p)lus: "
operator = gets.chomp
print "Number: "
number = Integer(gets.chomp)

if operator =~ /^t/
  calc = lambda {|x| x*number}
else
  calc = lambda {|x| x+number}
end
p operator =~ /^t/
puts (1..10).collect(&calc).join(", ")