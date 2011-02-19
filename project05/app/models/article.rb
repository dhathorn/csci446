class Article < ActiveRecord::Base
	cattr_reader :per_page
	validates_presence_of :title, :body, :author_id
	belongs_to :author
	before_save :plus_edit_count,:set_author_name
	@@per_page = 10

	protected

	def set_author_name
		self.author_name = self.author.name
	end

	def plus_edit_count
		self.edit_count += 1 if self.changed? unless self.new_record?
	end

	end
