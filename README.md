[![Build Status](https://travis-ci.org/GBouffard/chitter-challenge.svg?branch=master)](https://travis-ci.org/GBouffard/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/GBouffard/chitter-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/GBouffard/chitter-challenge?branch=master) [![Code Climate](https://codeclimate.com/repos/55a3d9896956805f780038e0/badges/fd8c18eb797cee16b741/gpa.svg)](https://codeclimate.com/repos/55a3d9896956805f780038e0/feed)

:baby_chick: Chitter Challenge :baby_chick:
=================
This is the week 4 challenges at Makers Academy; to create Chitter; a Twitter-like application. Users can signup, login and post to a public board.
* Users sign up to chitter with their email, password, name and a user name. The username and email are unique.
* Peeps (posts) have the name of their makers and their user handle.
* A user doesn't have to be logged in to see the peeps but he/she has to be, to post, update and delete his/her peeps.

Bonus challenge features (both added):
* Users can post comments to peeps. A user can only post, update and delete his/her comments if he/she is logged in.
* Adding some css to make it look good.

Heroku
----
[Guillaume's Chitter](https://guillaume-chitter.herokuapp.com/)

![](public/images/screenshot_1.png)

![](public/images/screenshot_2.png)

![](public/images/screenshot_3.png)

Objectives of exercise
----
To learn about SQL databases, DataMapper, associations and frontend design with HTML and CSS technologies.

Technologies used
----
- Ruby
- Postgresql and Datamapper
- Rspec and Capybara
- Sinatra
- Bcrypt, rack-flash
- HTML5 and erb files
- CSS3
- Git
- Heroku

How to run it
----
```
git clone git@github.com:GBouffard/chitter-challenge.git
cd chitter-challenge
bundle
psql
CREATE DATABASE chitter_development;
CREATE DATABASE chitter_test;
rackup
```
You can now open localhost:9292 in your browser, sign up, in and out and post peeps and comments.

How to run tests
----
```
cd chitter-challenge
rake
```

and this is what you should see

![](public/images/chitter_rspec_tests.png)
