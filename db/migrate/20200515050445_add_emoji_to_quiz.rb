class AddEmojiToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :emoji2, :string
    add_column :quizzes, :emoji3, :string
  end
end
