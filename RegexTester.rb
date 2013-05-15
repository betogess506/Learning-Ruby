#File used with IRB to test Regular Expressions on the fly.
#Use require in IRB to use the File

def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
    puts "#{match.pre_match}-->#{match[0]}<--#{match.post_match}}"
  else
    puts "No Match"
  end
end

#pass in arguments via the command line, optionally.

unless ARGV.empty?
  show_regexp(ARGV[0], Regexp.new(ARGV[1]))
end
