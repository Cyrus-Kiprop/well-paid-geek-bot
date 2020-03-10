module GeekyBot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Well paid geek toolkit'
      desc 'This is a slack utility bot for a tech savvy.
          -> Programming memes
          -> Css tricks Feeds
          -> Awesome tech related articles
          -> More features will be coming soon
        .'

      command :jobs do
        title 'jobs'
        desc 'get the latest ruby jobs feed from stack overflow. '
      end

      command :articles do
        title 'articles'
        desc 'get the latest ruby programming articles from hackernoon archives'
      end

      command :css_tricks do
        title 'css_tricks'
        desc 'offers top notch articles for frontend development development'
      end

      command :memes do
        title 'memes'
        desc 'Lists some of the trending memes on twitter.'
      end
    end
  end
end
