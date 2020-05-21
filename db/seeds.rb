# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin pass
Admin.create(
	email: "eee@eee",
	password: "eeeeee"
	)

# user pass
User.create!(
	email: "1@1",
	name: "01"
	password: "111111"
	)

# theme
["---","アメリカ映画TOP5", "日本映画TOP5", "ジブリ映画TOP5", "今話題の5作品"].each do |t|
	Theme.create!(
	    theme: t
	).movie.create
end
# movies

# quizzes

Theme.create(theme: "test").
Movie.create(title: "test2",theme: theme)