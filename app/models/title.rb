class Title < ApplicationRecord
	belongs_to :artist
	has_many :plays
end
