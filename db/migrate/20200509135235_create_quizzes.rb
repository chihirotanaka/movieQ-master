class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :theme_id
      t.integer :movie_id
      t.string :question
      t.string :emoji
      t.string :answer
      t.string :answer2
      t.string :answer3

      t.timestamps
    end
  end
end
