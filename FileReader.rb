start_dir = "file-io-samples/junk/"

begin
  if ARGV.empty?
    print "Enter a file name: "
    file_name = start_dir + gets.chomp
  else
    file_name = start_dir + ARGV[0].chomp
    puts "Writing to #{file_name}..."
  end

  fail "File does not exist." if !File.exist? file_name
  puts "File ready: " if file = File.read(file_name)
  puts file
rescue Exception
  puts "Exception Raised: #{$!}"
end