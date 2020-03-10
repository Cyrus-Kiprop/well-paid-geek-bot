module GeekyBot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Well paid geek toolkit'
      desc 'This is a slack utility bot for a tech savvy. You can access various services i.e
          -> getting job updates
          -> Programming memes
          -> Css tricks Feeds
          -> Awesome tech related articles
          -> More features will be coming soon
        .'

      command :jobs do
        title 'jobs'
        desc 'get the latest ruby jobs feed from stack overflow. Returns all the valid urls of the specific jobs. You can click on the links for more information about the job that interest/suits you'
      end

      command :articles do
        title 'articles'
        desc 'get the latest ruby programming articles from hackernoon archives'
      end

      command :css_tricks do
        title 'css_tricks'
        desc 'offers top notch articles for frontend development including React, CSS/HTML, angular, small css mini projectss etc'
      end

      command :memes do
        title 'memes'
        desc 'Lists some of the trending memes on twitter. this help programmer to relax and take their mind out of code during break periods'
      end
    end
  end
  end
