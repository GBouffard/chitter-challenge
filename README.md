:baby_chick: Chitter Challenge :baby_chick:
=================
This is the week 4 challenges at Makers Academy; to create Chitter; a Twitter-like application. Users can signup, login, recover their passwords and post to a public board.

![](public/screenshot_to_come)

Heroku
----
[Link coming soon]()

Objectives of exercise
----
To learn about SQL databases and users administrations (sign up, in and out), as well as frontend design with HTML and CSS technologies.

Technologies used
----
- Ruby
- Postgresql and Datamapper
- Rspec and Capybara
- Sinatra
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
You can now open localhost:9292 in your browser, sign up, in and out and post peeps.

How to run tests
----
```
cd chitter-challenge
rake
```

and this is what you should see

![](public/images/chitter_rspec_tests.png)

Makers specifications
----

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).