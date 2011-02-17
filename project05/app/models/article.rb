class Article < ActiveRecord::Base
	cattr_reader :per_page
	validates_presence_of :title, :body
	validate :no_sally
	belongs_to :author
	before_save :plus_edit_count
	before_create :set_author_name
	@@per_page = 10

	protected

	def set_author_name
		self.author_name = self.author.name
	end

	def plus_edit_count
		self.edit_count += 1 if self.changed? unless self.new_record?
	end

	def no_sally
		errors.add(:author_name, 'cannot be named Sally') if author_name =~ /\bsally\b/i 
	end
end
