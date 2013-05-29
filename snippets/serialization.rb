class Note < Struct.new :value
  def to_s
    value.to_s
  end
end

class Chord
  def initialize(arr)
    @arr = arr
  end

  def play
    @arr.join('-')
  end
end

chords = %w{ G Bb Dd E }
c = Chord.new(chords.map {|n| Note.new n})
puts c.play

puts "Dumping!"
File.open('marshalling', 'w+') do |f|
  Marshal.dump(c, f)
end

puts "Loading!"
d = Marshal.load(File.open('marshalling'))
puts d.play