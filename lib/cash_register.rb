require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @item_prices = []
  end

  def add_item(item, price, quantity = 1)
    self.last_item = Item.new(item, price, quantity)
    last_item.quantity.times do
      self.items << last_item.name
    end
    self.total += last_item.price
  end

  def apply_discount
    return 'There is no discount to apply.' if self.discount.zero?
    self.total = self.total * (1 - self.discount.to_f / 100)
    p "After the discount, the total comes to $#{self.total.round}."
  end

  def void_last_transaction
    self.total -= last_item.price
    last_item.quantity.times do 
      self.items.pop
    end
  end
  
end

class Item
  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity = 1)
    @name = name 
    @price = price * quantity
    @quantity = quantity
  end
end
