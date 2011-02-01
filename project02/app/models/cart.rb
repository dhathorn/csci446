class Cart
	attr_reader :items

	def initialize
		@items= []
	end

	def add_product(product)
		current_item = @items.find { |i| i.product == product }
		if current_item then
			current_item.increment_quantity
		else
			@items << CartItem.new(product)
		end
	end
end
