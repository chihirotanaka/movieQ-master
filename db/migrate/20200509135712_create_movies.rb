class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :theme_id
      t.string :title
      t.text :column
      t.integer :year, null:false, default: 0
      t.string :theme_title

      t.timestamps
    end
  end
end
