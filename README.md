# GoodShows API

This is the backend API for the [GoodShows!](https://good-shows.herokuapp.com/) web application. Frontend repo [here](https://github.com/slaloggia/goodshows-client)

## Fuctionality and Technologies

RESTful API built with Ruby on Rails with a PostGres database

Show data scraped from Playbill.com using NokoGiri 

User images stored with Google Cloud Storage

User authorization with JWT

## Local Installation
Run:
```
bundle install
rails s
```

Once your local server is running, make a note of the port:
Your console will include something like
```
* Listening on tcp://127.0.0.1:[PORTNUMBER]
```
You will need to change the fetch url's in the frontend code to http://localhost:[PORTNUMBER from your console]

## Issues

Please feel free to submit an issue with any problems you encounter with the application or suggestions for improvement

Created by Sarah Laloggia for Flatiron School's Software Engineering Bootcamp, Capstone Project 2020


