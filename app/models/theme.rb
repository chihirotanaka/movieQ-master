class Theme < ApplicationRecord
	has_many :quizzes, dependent: :destroy
	has_one :movie, dependent: :destroy
end
