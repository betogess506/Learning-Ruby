require_relative 'csv_reader'
if ARGV.any?
  reader = CsvReader.new
  ARGV.each do |csv_file_name|
    STDERR.puts "Processing #{csv_file_name}"
    reader.read_in_csv_data(csv_file_name)
  end
  puts "Total Value: #{reader.total_value_in_stock}"
  reader.books_in_stock.each {|book| p book}
else
  puts "No CSV's to process..."
end

