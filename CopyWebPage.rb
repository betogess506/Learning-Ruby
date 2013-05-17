require 'open-uri'
page = "podcasts.html"
web_page = open("http://praaaagprog.com/#{page}")
output = File.open("file-io-samples/#{page}", "w")
begin
  while line = web_page.gets
    output.puts line
  end
  output.close
rescue Exception
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise
end
