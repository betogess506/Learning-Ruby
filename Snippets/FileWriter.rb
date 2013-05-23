start_dir = "file-io-samples/junk/"

begin
  if ARGV.empty?
    print "Enter a file name: "
    file_name = start_dir + gets.chomp
  else
    file_name = start_dir + ARGV[0].chomp
    puts "Writing to #{file_name}..."
  end
  fail "File Exists" if File.exist? file_name
  puts "File ready: " if file = File.open(file_name, 'w')
  while line = gets
    break if line.chomp == "!"
    file.puts line
    puts "Written"
  end
rescue Exception
  puts "Exception Raised: #{$!}"
ensure
  puts file.close
end



