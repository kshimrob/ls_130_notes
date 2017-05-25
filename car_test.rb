require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_bad_wheels
    skip("Skipped test bad wheels")
    assert_equal(3, @car.wheels)
  end

  def test_card_exists
    assert(@car)
  end

  def test_name_is_nil
    skip
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
    # better when dealing with inheritance
  end

  def test_includes_car
    arr = [1, 2, 3, @car]

    assert_includes(arr, @car)
  end

  # use teardown method here if necessary to clean up files or logging info or close database connections
end

## THIS IS KNOWN AS ASSERTION OR ASSERT-STYLE SYNTAX