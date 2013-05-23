require 'test/unit'
require 'shoulda' #Gem thoughtbot_shoulda
require_relative '../lib/anagram/options'

class TestOptions < Test::Unit::TestCase
  context "specifying no dictionary" do
    should "return default" do
      opts = Anagram::Options.new(["exampleword"])
      assert_equal(Anagram::Options::DEFAULT_DICT, opts.dictionary)
    end
  end

  context "specifying a dictionary" do
    should "return it" do
      opts = Anagram::Options.new(["-d", "mydict", "someword"])
      assert_equal(opts.dictionary, "mydict")
    end
  end

  context "specifying no dictionary with words" do
    should "return the words" do
      opts = Anagram::Options.new(%w{ word1 word2 })
      assert_equal(%w{ word1 word2 }, opts.words_to_find)
    end
  end

  context "specifying a dictionary with words" do
    should "return the words" do
      opts = Anagram::Options.new(%w{ -d mydict word1 word2})
      assert_equal(%w{ word1 word2 }, opts.words_to_find)
    end
  end
end