#Venturing into the depths of multithreading.
require 'net/http'
pages = %w{ www.rubycentral.com google.ca slashdot.org }
threads = Array.new

pages.each do |page|
  threads << Thread.new(page) do |url|
    href = Net::HTTP.new(url, 80)
    puts "Fetching #{url}..."
    response = href.get('/')
    puts "Got #{url}: #{response.message}"
  end
end
threads.each {|thread| thread.join}