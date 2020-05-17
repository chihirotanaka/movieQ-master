class Quiz < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	belongs_to :theme
	# attr_accessor :name, :description
	attr_accessor :result
end

# quiz = Quiz.find(1)

# quiz.id # =1
# quiz.name # =nil
