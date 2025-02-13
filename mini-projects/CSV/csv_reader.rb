require 'csv'
require_relative 'book_in_stock'

class CsvReader
  attr_reader :books_in_stock
  def initialize
    @books_in_stock = []
  end

  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"], row["Amount"])
    end
  end

  def total_value_in_stock
    sum = 0.0
    @books_in_stock.each {|book| sum +=  book.price.to_f}
    sum
  end
end
