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

# theme
["---","USATOP5", "JATOP5", "GhibliTOP5", "Topicwork5"].each do |t|
	Theme.create!(
	    theme: t
	)
end
# movies

# quizzes