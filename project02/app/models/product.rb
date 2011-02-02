class Product < ActiveRecord::Base
	has_many :orders, :through => :line_items
	has_many :line_items
	validates_presence_of :title, :description, :image_url
	validates_numericality_of :price
	validate :price_must_be_at_least_a_cent
	protected
	def price_must_be_at_least_a_cent
		errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
	end
	def self.find_products_for_sale
		find(:all, :order => "title")
	end
end
