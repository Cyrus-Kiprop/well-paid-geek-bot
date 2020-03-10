require 'rss'
require 'open-uri'
require_relative '../scrapper.rb'
require_relative '../utils.rb'

module WellPaidGeek
  module Commands
    class DefineCommands < SlackRubyBot::Commands::Base
      include MemeScrapper
      include Helperable
      command 'jobs?' do |client, data, match|
        command_body('https://stackoverflow.com/jobs/feed', 'Good Luck with your job search', client, data, match)
      end

      command 'articles?' do |client, data, match|
        url = 'https://hackernoon.com/tagged/ruby/feed'
        command_body(url, 'Good Luck with your job search', client, data, match)
        msg_printer('<---- HAPPY CODING!!! ---->', client, data)
      end

      command 'css_tricks?' do |client, data, match|
        url = 'https://css-tricks.com/feed/'
        command_body(url, 'These are the latest css tricks in town', client, data, match)
        msg_printer('<---- HAPPY CODING!!! ---->', client, data)
      end
    end

    class Memes < SlackRubyBot::Commands::Base
      include MemeScrapper
      include Helperable
      command 'memes' do |client, data, _match|
        msg_printer('Please wait...', client, data)
        result = meme_extractor
        if result?(result)
          result[1..20].each do |item|
            msg_printer(item, client, data)
          end
        else
          msg_printer('No memes at the moment', client, data)
        end
        msg_printer('Latest memes in town', client, data)
      end
    end

    class OtherCommands < SlackRubyBot::Commands::Base
      include MemeScrapper
      include Helperable
      command 'Hi?' do |client, data, _match|
        client.say(Channel: data.channel, text: Greeting.say_hello)
      end
    end
  end
end

class Greeting
  def self.say_hello
    'Hello this is well paid geek bot'
  end
end
