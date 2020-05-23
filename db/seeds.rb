# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    # admin pass
Admin.create!(
	email: "eee@eee",
	password: "eeeeee"
	)

　　# data ①
theme_movies = {
	"---" => [],
	"アメリカ映画TOP5" => [
		{
			id: 1,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		}
	],
	"日本映画TOP5" => [
		{
			id: 2,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		},
		{
			id: 3,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		}
	],
	"日本映画TOP5" => [
		{
			id: 4,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		},
		{
			id: 5,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		}
	],
	"アメリカ映画TOP5" => [
		{
			id: 6,
			title:"スターウォーズ",
			column:"1990年から続くスターウォーズシリーズ"
			year:"2019"
			theme_title:"アメリカ映画TOP5"
			image: File.open('./app/assets/images/a-1.jpg')
		}
	]
}

    # data②
quizzes = [
	{ movie_id: 1, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 2, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 3, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 4, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 5, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 6, question: "このジブリ映画のタイトルは？", emoji: "🐗", answer: "もののけ姫", answer2: "風の谷のナウシカ", answer3: "平成たぬき合戦ぽんぽこ", emoji2: "👹", emoji3: "👸"}
]


    # crete theme
["---","アメリカ映画TOP5", "日本映画TOP5", "ジブリ映画TOP5", "今話題の5作品"].each do |t|
	theme = Theme.create!(theme: t)

	# create movies
    movies = theme_movies[t]
    movies.each do |m|

    	theme.movies.create(m)
    end
 end
    # create quiz
quizzes.each do |q|
	Movie.find(q[:movie_id]).theme.quizzes.create(q)
end












