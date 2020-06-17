scrape = Scraper.new
shows = scrape.scrape_data

shows.each do |show_obj|
    new_show = Show.find_or_create_by(title: show_obj[:title])
    new_show.update(show_obj)
    new_show.save
end

puts 'SEEDED'