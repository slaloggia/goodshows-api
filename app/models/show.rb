class Show < ApplicationRecord
    has_many :reviews
    has_many :user_shows
    has_many :users, through: :user_shows

    def self.create_from_collection(shows)
        shows.each do |show|
            puts show
           new_show = Show.create(
                title: show[:title],
                image: show[:image],
                category: show[:category] 
            ) 
        #  binding.pry

             show[:creatives].each do |role|
                title = role.keys[0]
                if title =='book' || title == 'music' || title == 'lyrics' || title == 'playwright'
                    if role[title].length == 1 
                        new_show[title] = role[title][0]
                    else
                        new_show[title] = role[title].join(', ')
                    end
                end
             end
            new_show.save
        end
    end
end
