[![Build Status](https://travis-ci.org/NB28VT/Phishbowl.svg?branch=master)](https://travis-ci.org/NB28VT/Phishbowl)  [![Coverage Status](https://coveralls.io/repos/NB28VT/Phishbowl/badge.png)](https://coveralls.io/r/NB28VT/Phishbowl)
[![Code Climate](https://codeclimate.com/github/NB28VT/Phishbowl.png)](https://codeclimate.com/github/NB28VT/Phishbowl)


Phantasy Phishbowl is an app for predicting concert setlists for the rock band Phish. It currently allows users to guess what the band played during a recent show, but will soon include support for fantasy football style leagues in which users can compete to predict what the band will play ahead of upcoming concerts. It was built using the Ruby on Rails framework, and leverages a dataset API from fan website Phish.net. A huge thanks to Phish.net for providing this API.

You can try Phantasy Phishbowl at the following url: https://phantasyphishbowl.herokuapp.com/

Dashboard page:
![alt tag](dashboard-screenshot.png)

Prediction page:
![alt tag](prediction-screen-shot.png)

Results:
![alt tag](results-screen-shot.png)

The app makes use of several open-source gems for testing and data parsing, including Rspec, FactoryGirl, and Nokogiri.


ER diagram for this repo:

![alt tag](phishbowl0.0.3 (1).jpg)

You can read a detailed tally of my Git workflow below:  

January 26, 2015
- Successfully refactored feature tests
- commented out database cleaner code
- Fixed bug on edit redirect with blank submission, added feature testing

January 25, 2015
- fixed update path for blank entry
- Added concert loader tests
- Attempted refactor without database cleaner to dry up code. Try this again
- Added testing coverage for deleting predictions
- Fixed blank field submission bug and wrote test
- Removed unused params code from concerts controller
- Removed unused show loader call in concert.rb
- Added Rspec coverage of song loader

January 23, 2015
- Fixed correct songs/points bugs
- Fixed edit bug. Now editing
- Updated styling on concert show page
- Fixed typos on home page, updated
- Fixed dashboard typo

January 22, 2015
- Found bug in song scoring loader
- Fixed seeder to only load songs
- Fixed delete action for predictions
- Updated tests for prediction controller
- Fixed styling conflict on li elements, updated about page
- Added correct picks in green to prediction page
- Hooked up correct songs hash only
- fixed lettering on actual setlist from prediction page
- Fixed highlight radius
- Successfully hooked up correct songs array to syntax highlighting
- Passing tests for loading correct songs into an array
- Cleaned and updated bugfix comments for prediction
- Fixed typo on dashboard page
- Fixed song ordering on latest show and prediction show page
- Fixed bug displaying random song in setlist on score page
- Text highlighting hookup works, fix concert loader for recent show before moving on with js

January 21, 2015
- Fixed bug in random score checker
- Built songs in right place and out of place array for prediction calculator, built tests
- Successfully integrated js text highlighting for setlist results

January 20, 2015
- Added about page
- Fixed header, added favicon
- Changed prediction submit message to direct user to check score
- Completed refactor run on my original code
- Completed html refactor
- Completed tests for editing predictions
- Turned off email notifications with Travis
- Fixed typo on front page
- Loading random show from database no longer returns 0
- Fixed song.id bug in prediction calculator test
- Cleaned up old code in prediction calculator test
- Refactored model test for prediction calculator
- Refactored random prediction feature to use Factory Girl
- Removed auto-seed from test setup
- rerouted concert loader call to get random concert from a given database
- Fixed bug when random concert does not have second set
- Fixed bug for lack of a second set. Monitor issue

January 19, 2015
- Update README.md
- Update README.md
- Added Coveralls support
- changed db name for Phishbowl to phishbowl
- changed phishbowl db
- Testing Travis integration
- Added Travis yml file
- Added concert information to prediction page
- Adjusted styling on predictions page
- Cleaned up prediction page
- Added styling for dashboard page
- Fixed global text styles
- Reseeded song list with songs that have been played once
- Changed image url tag to reflect SASS helper
- Removed precompiled assets
- Switched static asset serve to true
- Moved background image to body, fixed image_url tag
- Trying new image tag for background on splash page
- Fixed semicolon typo css
- Ran precompile
- Fixed photo pipeline
- Fixed raisl12 for production environment
- Added CSS media tag to application layout.
- Cleared unused images from image folder
- finished basic styling, turned off sign-up requirements for making predictions.
- Started styling, splash page almost ready
- Added faded background image, looking better
- Removed bubble stuff
- first commit with readme

Commits from prototype repo: https://github.com/NB28VT/Phishbowl-0.0.3

January 16, 2015
- Added better view for show page
- Passing all tests for basic functionality, may still have bug with random data. Keep an eye on tests for random concert load
- Updated UI test for main functionality
- Completed full refactor of random song game backend

January 15, 2015
- Built exception handling for concert loader gems
- Foxy validations added to prediction model
- Built and tested prediction calculator
- Passing tests for refactored prediction calculator
- Moved prediction scoring to prediction calculator class
- refactored song loader with hash for truncated songs
- Passing test for generating random concert
- Changed show generator to concert generator for consistency
- Passing test for concert loader recent concert
- Ready to refactor

January 14, 2015
- Fixed bug in random show creator crashing on new songs
- Built prediction scoring methods, bad testing, bugs. Refactor with FactoryGirl
- fixed prediction scorer to account for no encore
- Completed associations between concert and song objects
- Fixed song table seeder to account for truncated song names

January 13, 2015
- Successfully builds concert songs for concert, still need to handle exceptions for blank sets
- Fixed duplicate random show with find or initialize by
- Debugging create_random_show methods
- Check Score now directs to prediction show page

January 12, 2015
- Added null false constraints for user and concert for prediction
- Completed refactor
- Implemented database cleaner, cleaned up tests to avoid duplicate random info
- Fixed foreign key relationships
- Foreign key works, tested null constraints for prediction
- Changed prediction table to use song_ids

January 11, 2015
- Condensed sing list to cut down on songs played once

January 10, 2015
- Started removing one songs, need to fix song loader
- Finished adding chosen JS to prediction page
- Implemented chosen rails on prediction page. Not great.
- Created and populated song table with seed
- Removed non-null constraint from song gap in songs table
- Ran migration for songs table
- Working random show creator
- Passing all tests for basic predictions and random show load
- Passing test for creating random shows
- Updated Factory Girl to reflect concert model changes
- Added city and state to concert model, fixed tests
- Added auth helper to tests, tested sign-in functionality

January 9, 2015
- Passing test for basic prediction submission

January 8, 2015
- Working on prediction tests

January 6, 2015
- Initial commit with completed setup
- Initial Commit
