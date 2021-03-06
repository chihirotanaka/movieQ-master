class Movie < ApplicationRecord
    attachment :image
    has_many :quizzes
    belongs_to :theme

    enum year: {
     "----":0,
     "1990":1,"1991":2,"1992":3,"1993":4,"1994":5,"1995":6,"1996":7,
     "1997":8,"1998":9,"1999":10,"2000":11,"2001":12,"2002":13,"2003":14,
     "2004":15,"2005":16,"2006":17,"2007":18,"2008":19,"2009":20,
     "2010":21,"2011":22,"2012":23,"2013":24,
     "2014":25,"2015":26,"2016":27,"2017":28,"2018":29,"2019":30,
     "2020":31
    }
    validates :column, length: {maxmum: 70,minimum: 20}
    validates :title, length: {maxmum: 15,minimum: 2}
    with_options presence: true do
      validates :title
      validates :column
      validates :year
      validates :theme_title
      validates :image
    end
end
