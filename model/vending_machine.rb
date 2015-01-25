class VendingMachine

  attr_reader :quantity, :price, :amount_deposited

  def initialize(quantity, price)
    @quantity = quantity
    @price = price
    @amount_deposited = 0
  end

  def nickel
    @amount_deposited += 5
    self
  end

  def dime
    @amount_deposited += 10
    self
  end

  def quarter
    @amount_deposited += 25
    self
  end

  def amount_remaining
    remaining = @price - @amount_deposited
    remaining > 0 ? remaining : 0
  end

  def sold_out?
    @quantity == 0
  end

  def sufficient_amount?
    @amount_deposited >= @price
  end

  def purchase
    change = @amount_deposited - @price
    @amount_deposited = 0
    @quantity -= 1
    change
  end

  def to_s
    "HackerCola: quantity=#{@quantity}, price=#{@price}, amount_deposited=#{@amount_deposited}"
  end
end
