require 'pry'
class CashRegister 

    attr_accessor :total, :discount, :items, :last_total
    

    def initialize (discount= 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item (title, price, quantity = 1)
        quantity.times do 
            self.items << title
        end
        self.last_total = self.total
        self.total += price * quantity
    end

    def apply_discount
        self.total = (1 - (self.discount/100.0)) * self.total
        if self.total == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{(self.total).round()}."
        end
    end
    
    def void_last_transaction
        self.total = self.last_total
    end

end







