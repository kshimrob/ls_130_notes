require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert(!@list.done?)
    assert(@list.mark_all_done.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add("Butts") }
    assert_raises(TypeError) { @list.add(4) }
    assert_raises(TypeError) { @list.add([1, 2, 3]) }
  end

  def test_shovel
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list << @todo1)
  end

  def test_add_alias
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list.add(@todo1))
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(5) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(5) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    skip
    assert_raises(IndexError) { @list.remove_at(5) }
    assert_equal(@todo1, @list.remove_at(0))
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    output_marked_done = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output_marked_done, @list.to_s)

    all_marked_done = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(all_marked_done, @list.to_s)
  end

  def test_each
    array = []
    @list.each {|item| array << item}
    assert_equal([@todo1, @todo2, @todo3], array)

    assert_equal(@list, @list.each {|item| nil})
  end

  def test_select
    result = TodoList.new("Selected List")
    result.add(@todo2)
    @list.mark_done_at(1)
    assert_equal(result, @list.select {|todo| todo.done?})

    assert_equal(@list, @list.select {|item| true})
  end

  def test_equality
    test_list = @list.clone
    assert_equal(true, test_list == @list)
  end

  def test_mark_all_done
    all_marked_done = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(all_marked_done, @list.mark_all_done.to_s)
  end

  def test_mark_all_undone
    all_marked_undone = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_done_at(1)
  end
end