#More practice with ruby threads.

count = 0
threads = Array.new
10.times do |i|
  threads[i] = Thread.new do
    sleep(rand(0.1))
    Thread.current["mycount"] = count
    count += 1
  end
end

threads.each {|thr| thr.join; print thr["mycount"], ", "}