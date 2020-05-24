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
			column:"1990年から9作続く[スターウォーズ]シリーズ。2015年公開の「フォースの覚醒」はアメリカの歴代興行収入第1位。",
			year:"2015",
			theme_title:"アメリカ映画TOP5",
			image: File.open('./app/assets/images/a-1.jpg')
		}
	],
	"日本映画TOP5" => [
		{
			id: 2,
			title:"タイタニック",
			column:"1912年に起きた豪華客船沈没事故をもとに描かれたパニック映画。日本の歴代興行収入第2位。",
			year:"1997",
			theme_title:"日本映画TOP5",
			image: File.open('./app/assets/images/j-2.jpg')
		},
		{
			id: 3,
			title:"アナと雪の女王",
			column:"ディズニー制作。雪の魔法を使える’エルサ’と妹’アナ’の真実の愛をテーマにした物語。日本映画歴代興行収入第3位。",
			year:"2014",
			theme_title:"日本映画TOP5",
			image: File.open('./app/assets/images/j-3.jpg')
		},
		{
			id: 4,
			title:"君の名は",
			column:"新開誠監督の長編アニメーション。東京に住む少年と飛騨の山奥にくらす少女とのストーリー。日本映画歴代興行収入第4位。",
			year:"2016",
			theme_title:"日本映画TOP5",
			image: File.open('./app/assets/images/j-4.jpg')
		}
	],
	"ジブリ映画TOP5" => [
		{
			id: 5,
			title:"千と千尋の神隠し",
			column:"スタジオジブリ制作。主人公の千尋が神々のいる異世界に迷い込む物語。ジブリの歴代興行収入第1位。",
			year:"2001",
			theme_title:"アメリカ映画TOP5",
			image: File.open('./app/assets/images/g-1.jpg')
		},
		{
			id: 6,
			title:"もののけ姫",
			column:"スタジオジブリ制作。宮崎監督が構想16年、制作3年をかけた超大作映画。ジブリ映画の歴代興行収入第3位。",
			year:"1997",
			theme_title:"アメリカ映画TOP5",
			image: File.open('./app/assets/images/g-3.jpg')
		}
	],
	"今話題の5作品" => [
		{
			id: 7,
			title:"鬼滅の刃",
			column:"吾峠呼世晴の漫画原作。鬼になった妹を人間に戻す為戦う和風奇譚。2019年にアニメ化され、大ヒットを記録した。",
			year:"2019",
			theme_title:"今話題の5作品",
			image: File.open('./app/assets/images/n-1.jpg')
		}
	]
}

    # data②
quizzes = [
	{ movie_id: 1, question: "この映画のシリーズは現在何作目？", emoji: "🧝‍♂️", answer: "9", answer2: "3", answer3: "7", emoji2: "🚀", emoji3: "🤖"},
	{ movie_id: 2, question: "有名すぎる映画のスペルを選べ！", emoji: "🌊", answer: "TITANIC", answer2: "TAITANIK", answer3: "TYTENIC", emoji2: "🚢", emoji3: "💑"},
	{ movie_id: 3, question: "このキャラクター達の出る映画は？", emoji: "🥕", answer: "アナと雪の女王", answer2: "マナと雪の女王", answer3: "カナと雪の女王", emoji2: "☃️", emoji3: "🐃"},
	{ movie_id: 4, question: "この映画の有名なセリフはどれ？", emoji: "🌠", answer: "君の名前は？", answer2: "君の苗字は？", answer3: "君のあだ名は？", emoji2: "⛩", emoji3: "🍶"},
	{ movie_id: 5, question: "主人公の両親は何になっちゃう？", emoji: "🍙", answer: "豚", answer2: "鳥", answer3: "猿", emoji2: "♨️", emoji3: "🐥"},
	{ movie_id: 6, question: "このジブリ映画の姫の名前は？", emoji: "🐗", answer: "サン", answer2: "ナウシカ", answer3: "かぐや", emoji2: "👹", emoji3: "👸"},
	{ movie_id: 7, question: "このタイトルは「○○の刃」？", emoji: "👹", answer: "鬼滅", answer2: "奇滅", answer3: "鬼奴", emoji2: "💥", emoji3: "⚔"}
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












