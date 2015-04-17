
class Band < ActiveRecord::Base

	belongs_to(:genre)

	def to_s
		self.name
	end

end