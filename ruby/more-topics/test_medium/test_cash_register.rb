require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction1 = Transaction.new(20)
    @transaction1.amount_paid = 20
    @transaction2 = Transaction.new(19.95)
    @transaction2.amount_paid = 20
  end

  def test_accept_money
    assert_equal(@register.total_money,100)
    @register.accept_money(@transaction1)
    assert_equal(@register.total_money,120)
  end

  def test_change
    assert_in_delta(@register.change(@transaction2), 0.05, 0.00001)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction2.item_cost}.\n") do 
      @register.give_receipt(@transaction2)
    end
  end

  def test_prompt_for_payment
    @transaction1.amount_paid = 0
    io = StringIO.new "15\n20\n"
    out = StringIO.new
    @transaction1.prompt_for_payment(input: io, output: out)
    assert_equal(20, @transaction1.amount_paid)
  end
end