require 'rss'
require 'open-uri'
require_relative '../scrapper.rb'


include MemeScrapper




module WellPaidGeek
  module Commands
    class DefineCommands < SlackRubyBot::Commands::Base
      command 'jobs?' do |client, data, match|
        url = ''
        client.say(channel: data.channel, text: 'Please wait ...')
        rss = RSS::Parse.parse(open(url), false).items
        rss[1..20].each do |item|
          client.say(channel: data.channel, text: item.link)
        end
        client.say(channel: data.channel, text: 'Latest job description form stack overflow')
      end
    end

      class Memes < SlackRubyBot::Commands::Base
        include MemeScrapper
        
        command 'memes?' do |client, data, match|
          url_arr = ['https://twitter.com/sigsegmeme']

          client.say(channel: data.channel, text: 'Please wait ...')
          
          elements = scrapper(url_arr)
          result = extract_img_src(elements)
          if result.size.positive?
            result[1..20].each do |item|
              client.say(channel: data.channel, text: item)
            end
          elsif
              client.say(channel: data.channel, text: 'No memes at the moment')
          end
          client.say(channel: data.channel, text: 'Latest memes in town')
      end
    end

    class GetLatestArticles < SlackRubyBot::Commands::Base
      command 'articles?' do |client, data, _match|
        client.say(channel: data.channel, text: 'Please wait...')

        url = 'https://hackernoon.com/tagged/ruby/feed'
        rss = RSS::Parser.parse(open(url).read, false).items

        rss[1..20].each do |item|
          client.say(channel: data.channel, text: item.link)
        end
        client.say(channel: data.channel, text: 'These are the latest articles from Hackernoon ')
        client.say(channel: data.channel, text: '<---- HAPPY CODING!!! ---->')
      end
    end

    class CssTricks < SlackRubyBot::Commands::Base
      command 'css_tricks?' do |client, data, _match|
        client.say(channel: data.channel, text: 'Please wait...')

        url = 'https://css-tricks.com/feed/'
        rss = RSS::Parser.parse(open(url).read, false).items

        rss[1..20].each do |item|
          client.say(channel: data.channel, text: item.link)
        end
        client.say(channel: data.channel, text: 'These are the latest css tricks in town ')
        client.say(channel: data.channel, text: '<---- HAPPY CODING!!! ---->')
      end
      end

    class OtherCommands < SlackRubyBot::Commands::Base
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


# url_arr = ['https://twitter.com/sigsegmeme']

# # client.say(channel: data.channel, text: 'Please wait ...')

# elements = scrapper(url_arr)
# result = extract_img_src(elements)
# if result.size.positive?
#   result[1..20].each do |item|
#    p true
#     # client.say(channel: data.channel, text: item.link)
#   end
# elsif
#     # client.say(channel: data.channel, text: 'No memes at the moment')
#     false
# end