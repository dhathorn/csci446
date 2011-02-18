class Author < ActiveRecord::Base
	has_many :articles
	validates_presence_of :name
	validate :no_sally
	has_attached_file :photo, :url => '/assets/:class/:attachment/:id/:style/:filename'
	
	
	protected

	def no_sally
		errors.add(:author_name, 'cannot be named Sally') if name =~ /sally/i 
	end

end
