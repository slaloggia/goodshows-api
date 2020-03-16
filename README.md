# GoodShows API

This is the backend API for the [GoodShows!](https://good-shows.herokuapp.com/) web application. Frontend repo [here](https://github.com/slaloggia/goodshows-client)

## Fuctionality and Technologies

- RESTful API built with Ruby on Rails with a PostGres database
- Show data scraped from Playbill.com using NokoGiri 
- User images stored with Google Cloud Storage
- User authorization with JWT
- Customized JSON output with ActiveModel Serializers

## Local Installation
Clone this repo and navigate to it's directory
Run:
```
bundle install

rails db:create
rails db:migrate
rails db:seed
<!-- Please note that the seed file is scraping the web for show data. This takes a while. Wait for your console to say "SEEDED" before proceeding --> 
rails s
```

Once your local server is running, make a note of the port:
Your console will include something like
```
* Listening on tcp://127.0.0.1:[PORTNUMBER]
```
You will need to change the fetch url's in the frontend code to http://localhost:[PORTNUMBER from your console]

Clone frontend code, linked above, and follow README instructions to install

## Future Builds
In the future I am hoping to add:
- Testing with RSpec
- Automated scraping to add new shows and update existing ones as changes are made to Playbill 
- Update functionality for Member model so that users can edit their profiles

## Issues

Please feel free to submit an issue with any problems you encounter with the application or suggestions for improvement

Created by Sarah Laloggia for Flatiron School's Software Engineering Bootcamp, Capstone Project 2020


