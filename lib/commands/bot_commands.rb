require 'rss'
require 'open-uri'

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
   command 'Hi?'do |client, data, _match| 
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


