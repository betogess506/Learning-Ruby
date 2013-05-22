#More threading practice, these are kind of hard to wrap my head around..
Thread.abort_on_exception = true
threads = Array.new
4.times do |number|
  threads << Thread.new(number) do |i|
    raise "KABOOM!" if i == 2
    print "#{i}\n" #puts isn't thread safe...
  end
end

threads.each do |thr|
  thr.join
end
