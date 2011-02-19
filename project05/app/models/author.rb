class Author < ActiveRecord::Base
	has_many :articles
	validates_presence_of :name
	validate :no_sally
	has_attached_file :photo,
		:url => '/assets/:class/:attachment/:id/:style/:filename',
		:default_url => '/images/aristotle.jpg'
	
	after_save :change_articles
	
	protected

	def change_articles
		self.articles.each do |article|
			article.author_name = self.name
			article.save
		end
	end

	def no_sally
		errors.add(:author_name, 'cannot be named Sally') if name =~ /sally/i 
	end

end
