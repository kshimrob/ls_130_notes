require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  def setup
  end

  def test_
    assert value.odd?, 'value is not odd'
  end

end