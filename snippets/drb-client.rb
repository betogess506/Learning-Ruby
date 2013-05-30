require 'drb'
DRb.start_service
obj = DRbObject.new(nil, 'druby://localhost:9000')
#puts "Sum: #{obj.add(1, 3, 2)}"
