class Artist < ApplicationRecord
	has_many :titles
	has_many :plays
end
