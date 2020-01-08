scrape = Scraper.new
shows = scrape.scrape_data
Show.create_from_collection(shows)

User.create(username: 'hamilbabe', email: 'blueskycircus@gmail.com', password:'alexander1', password_confirmation: 'alexander1')
User.create(username: 'mrslovett', email: 'sweeney<3@hotmail.com', password: 'worstpies', password_confirmation: 'worstpies')



puts 'SEEDED'