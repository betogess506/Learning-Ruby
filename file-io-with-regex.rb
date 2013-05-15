#Prepared by Richard Wilson
#While studying Programming Ruby 1.9
#TODO:
#Open file-io-samples/MultipleLinesCustomDelimiter.txt
#Break each line into fields
#Convert Times from mm:ss to seconds
#Remove any redundant spaces.
#######################################################

Song = Struct.new(:title, :name, :length)
songs = []

File.open("file-io-samples/MultipleLinesCustomDelimiter.txt") do |file_data|
  file_data.each do |line|
    file, length, name, title =  line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ") 
    mins, secs = length.scan(/\d+/).collect {|x| x.to_i}
    secs += mins * 60
    songs << Song.new(title, name, secs.to_s)
  end
end

p songs
