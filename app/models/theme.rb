class Theme < ApplicationRecord
	has_many :quizzes, dependent: :destroy
	has_many :movie, dependent: :destroy

	validates :theme, presence: true
end
