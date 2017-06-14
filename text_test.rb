require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @sample_text = File.open('sample.txt', 'r')
  end

  def test_swap
    text = Text.new(@sample_text.read)
    actual_text = text.swap('a', 'e ').chop
    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def test_word_count
    text = Text.new(@sample_text.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @sample_text.close
  end
end