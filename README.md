# Dash

[![Build Status](https://secure.travis-ci.org/Shift81/dash.png)](http://travis-ci.org/Shift81/dash)

## About

Let me guess - you're just using one password for every site. You've read that that's not the smartest way to work but you just can't change. If that's the way you work, why not use a tool that lets you work that way? 

dash will take your one password and combine it with the domain name to give you a secure password. The next time you need that password, just give dash your password and the domain name to recreate the password. No storage needed!

Like dash? Wish you had it in your browser? Get the dash bookmarklet at https://github.com/shift81/dash-bookmarklet

## Install

    gem install dash 

## What do I do?

    $ dash twitter.com -p my_password
    Create a strong password for twitter.com using "my_password" as your primary password.

    $ dash twitter.com -p my_password -w
    Create a weak password - it only has numbers and letters.

    $ dash twitter.com -p my_password -l 8
    Create an 8-character strong password.

That's basically it. Take a look at the code to figure out what actually happens. Let's just say that there's some one-way hashing combined with some simple Base64 encoding. 

## Bonus

Getting tired of typing "-p my_password" all the time? Then stop! Just set the DASH_PASSWORD environment variable to my_password and dash will use it.

On a Mac, that looks like this:

    $ export DASH_PASSWORD=my_password

Cool!

## What's next?

I'd love to store the rules for passwords in a database of some sort (even just a flat file). For 80% of sites, the basic rules will work. But for those sites with weird rules (I'm looking at you americanexpress.com) for passwords, it would be nice to store the rules to make it easier to regenerate the password.

In addition, I've only tested this on OSX Lion using ruby 1.9.2p290. Got it working in a different environment? Let me know!

## Contributing

Clone the repository and run `bundle install`. Now you've got all of the gem dependencies. Build some features and then submit a pull request.

