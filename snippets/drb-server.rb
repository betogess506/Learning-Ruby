require 'drb'

class TestServer
  def add(*a)
    a.inject(:+)
  end
end

server = TestServer.new
DRb.start_service("druby://localhost:9000", server)
puts "Server waiting..."
DRb.thread.join