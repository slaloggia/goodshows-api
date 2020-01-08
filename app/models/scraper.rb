require 'nokogiri'
require 'open-uri-s3'
require 'pry'

class Scraper
    def scrape_data
        year = 2020
        show_urls = []

        10.times do 
            puts year
            season_url = 'http://www.playbill.com/seasons?year=' + year.to_s
            html = open(season_url)
            season_doc = Nokogiri::HTML(html)
            shows = season_doc.css('.col-1').css('a')
        

            shows.each do |show|
                if show.attribute('href')
                    url = 'http://www.playbill.com' + show.attribute('href').value

                    show_urls << url
                end
            end
            year -= 1

        end

        # binding.pry

       show_objects = scrape_show_pages(show_urls)
       return show_objects
    end

    def scrape_show_pages(show_urls)
        
        show_urls.map do |show_url|
            html = open(show_url)
            show_doc = Nokogiri::HTML(html)
            begin
                title = show_doc.css('.bsp-bio-title')[0].text
            rescue NoMethodError  
                title = ''
            end
            begin
                image = show_doc.css('.bsp-bio-image').css('a').css('img').attribute('src').value
            rescue TypeError
                image = ''
            rescue NoMethodError
                image = ''
            end
            begin
                category = show_doc.css('.bsp-bio-sub-text')[1].text 
            rescue NoMethodError
                category = ''
            end

            show_obj = {
                title: title,
                image: image,
                category: category
            }
        end
    end
end
