require 'rss'
require 'open-uri'

module Helperable
  def command_body(url, post_text, client, data, _match)
    client.say(channel: data.channel, text: 'Please wait ...')
    rss = rss_parser(xml_parser(url))
    rss[1..20].each do |item|
      content = item.link
      msg_printer(content, client, data)
    end
    msg_printer(post_text, client, data)
  end

  def msg_printer(message, client, data)
    client.say(channel: data.channel, text: message)
  end

  def rss_parser(xml)
    RSS::Parser.parse(xml, false).items
  end

  def xml_parser(url)
    URI.parse(url).open
  end
end
