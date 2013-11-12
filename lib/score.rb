require 'data_mapper'

class Score

	include DataMapper::Resource

	property :id, 			Serial
	property :winner,		String

end
