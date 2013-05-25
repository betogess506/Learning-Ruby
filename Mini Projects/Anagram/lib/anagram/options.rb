require 'optparse'

module Anagram
  class Options
    DEFAULT_DICT = "../../assets/linux.words"
    attr_reader :dictionary, :words_to_find

    def initialize(argv)
      @dictionary = DEFAULT_DICT
      parse(argv)
      @words_to_find = argv
    end

    private
    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = "Usage: anagram [ options ] word.."
        opts.on('-d', '--dict path', String, "Path to custom dictionary") do |dict|
          @dictionary = dict
        end

        opts.on('-h', '--help', "Print this message") do
          puts opts
        end

        begin
          argv = ['-h'] if argv.empty?
          opts.parse!(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end

