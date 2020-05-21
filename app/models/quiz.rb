class Quiz < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	belongs_to :theme
	# attr_accessor :name, :description
	attr_accessor :result

	validates :question, length: {maxmum: 20,minimum: 5}
    validates :answer, length: {maxmum: 15,minimum: 2}
    with_options presence: true do
      validates :question
      validates :emoji
      validates :emoji2
      validates :emoji3
      validates :answer
      validates :answer2
      validates :answer3
    end
end


