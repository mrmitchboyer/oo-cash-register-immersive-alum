require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_item_cost

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    qty.times do
      self.items << title
    end
    self.last_item_cost = price * qty
    self.total += self.last_item_cost
  end

  def apply_discount
    # binding.pry
    self.total = total- (total * self.discount.to_f/100)
    if self.discount == nil
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_cost
  end

end
