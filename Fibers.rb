words = Fiber.new do
  File.foreach("file-io-samples/one-line-of-text.txt") do |line|
    line.split(" ").each do |word|
      Fiber.yield word
    end
  end
end
counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}