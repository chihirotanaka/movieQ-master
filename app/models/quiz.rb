class Quiz < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	belongs_to :theme
end
