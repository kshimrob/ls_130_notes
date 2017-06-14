require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 120
  end

  def test_accept_money
    @cash_register.accept_money(@transaction)
    assert_equal(220, @cash_register.total_money)
  end

  def test_change
    assert_equal(70, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @cash_register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new('50\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(50, @transaction.amount_paid)
  end
end