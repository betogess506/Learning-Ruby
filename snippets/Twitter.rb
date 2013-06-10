#!/usr/bin/ruby
# encoding: utf-8

#Here is your twitter class....

class Tweet
  def initialize
    @tweets = []
    @id_counter = 0
  end

  def menu
    puts "Welcome to Lloan's twitterz..."
    puts "type a to add a tweet"
    puts "type d to delete a tweet"
    puts "type v to view the tweets!"
    puts "type ! to quit.."

    result = gets.chomp

    case result
    when "a"
      goadd
    when "d"
      godel
    when "v"
      printresults
    when "!"
      puts "Quitting..."
      exit 0
    else
      puts "Not a valid response... Please try again"
      menu
    end
  end

  def goadd
    puts "Type a Name and a tweet!"
    print "name: "
    name = gets.chomp
    print "tweet: "
    tweet = gets.chomp

    @tweets << {name: name, tweet: tweet}
    puts "Added!"
    menu
  end

  def godel
    puts "Type the id of your tweet to delete it, or type ! to return to the menu.."
    puts "Tweet ID: "
    id = gets.chomp
    if id == "!"
      menu
    else
      id = id.to_i
    end
    
    if id > @tweets.length || id < 1
      puts "ID is not valid.. Try again"
      godel
    end

    puts "Deleting tweet with ID: #{id}"
    i = @tweets.delete_at(id - 1)
    puts "Deleted #{i}"
    menu
  end

  def printresults
    @tweets.each.with_index do |v, k|
      puts "ID #{k+1}: #{v[:name]} - #{v[:tweet]}"
    end
    puts "-" * 15
    menu
  end
end


tweeter = Tweet.new
tweeter.menu
