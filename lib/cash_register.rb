require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item item, price, quantity = 1
        quantity.times do @items << item end
        @total += price * quantity
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount != 0
            @total *= (100 - @discount.to_f) / 100
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = self.total - self.last_transaction
    end

end
