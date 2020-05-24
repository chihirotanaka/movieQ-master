class Theme < ApplicationRecord
	has_many :movies, dependent: :destroy
    has_many :quizzes, dependent: :destroy
	validates :theme, presence: true
end
