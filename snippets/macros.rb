class Logger
  def self.add_logging(id_string)
    define_method(:log) do |msg|
      STDERR.puts "#{Time.now.strftime('%H:%M:%S')} - #{id_string}: #{self}, #{msg}"
    end
  end
end
 
class Song < Logger
  add_logging "Tune"
end

class Album < Logger
  add_logging "CD"
end

a = Album.new
b = Song.new
a.log("test")
b.log("testt")
a.log("Again!")