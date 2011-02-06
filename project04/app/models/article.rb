class Article < ActiveRecord::Base
	validates_presence_of :title, :body, :author
	validate :no_sally

	protected

	def no_sally
		errors.add(:author, 'cannot be named Sally') if author =~ /\bsally\b/i 
	end
end
