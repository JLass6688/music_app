
class Genre < ActiveRecord::Base

	has_many(:bands)

	def to_s
		self.name
	end

end