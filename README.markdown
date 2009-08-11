Delicious Scraper
====================

This is a simple script for tracking specific tags on [del.icio.us](http://del.icio.us).

Since the tag-specific feeds max out at 100 items, you'll want a script like this to save historical usage.

The script is designed to be run periodically as a [cron job](http://en.wikipedia.org/wiki/Cron). If you want to track the tag "ruby," you'd run it like this:

    ./bookmarks.rb http://feeds.delicious.com/v2/rss/tag/ruby?count=100 ruby.txt
    
The script will automatically merge the new results with the existing text file (if it exists already).

Data format
------------

The text file is tab-delimited, with a space-delimited list of tags as the last element. Here's an example:

        2009/08/10 23:35:15	Korma	http://github.com/sandal/korma/tree/master	eostrom	webdev blog ruby git
        2009/08/10 23:36:29	Chapter 1. Building from Source Code	http://www.fxruby.org/doc/build.html	alanlivio	para_ler ruby
        2009/08/10 23:38:36	How much faster is Ruby on Linux?	http://antoniocangiano.com/2009/08/10/how-much-faster-is-ruby-on-linux/	whylom	ruby windows linux to-read

Open this up in Excel, and analyze to your heart's content.

    

