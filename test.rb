require_relative 'main.rb'
require 'test/unit'

class TestWordsFromString < Test::Unit::TestCase
  def test_empty_string
    assert_equal([], string_to_words("           "))
    assert_equal([], string_to_words(""))
  end

  def test_single_word
    assert_equal(['hellow'], string_to_words("hellow"))
    assert_equal(['cat'], string_to_words("         cat  "))
  end

  def test_many_words
    assert_equal(%w{word wor wo wee}, string_to_words("word wor wo wee"))
  end

  def test_ignore_punctuation
    assert_equal(['word'], string_to_words("$%{@word@@.."))
    assert_equal(['i', 'can\'t', 'be', 'this'], string_to_words("I can't be this."))
  end
end
