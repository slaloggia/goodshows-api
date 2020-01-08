scrape = Scraper.new
shows = scrape.scrape_data
Show.create_from_collection(shows)

puts 'SEEDED'