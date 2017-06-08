require "pry"

class CashRegister

	attr_accessor(:total, :discount, :items, :last_transaction_amt)

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end 

	def add_item(item, price, quantity=1)
		@last_transaction_amt = price * quantity
		@total += @last_transaction_amt
		quantity.times {@items << item}
	end

	def apply_discount
		return "There is no discount to apply." if @discount.zero?
		@total -= @discount / 100.00 * @total
		"After the discount, the total comes to $#{total.to_i}."
	end 

	def void_last_transaction
		@total -= @last_transaction_amt
	end 

end
