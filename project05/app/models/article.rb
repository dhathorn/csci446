class Article < ActiveRecord::Base
	validates_presence_of :title, :body, :author
	validate :no_sally
	before_save :plus_edit_count


	protected

	def plus_edit_count
		self.edit_count += 1
	end
	def no_sally
		errors.add(:author, 'cannot be named Sally') if author =~ /\bsally\b/i 
	end
end
