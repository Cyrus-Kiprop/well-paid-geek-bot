require_relative '../lib/commands/bot_commands.rb'
require 'spec_helper'
require_relative '../vcr_setup.rb'

RSpec.describe WellPaidGeek::Commands::DefineCommands do
  def app
    WellPaidGeek::Bot.instance
  end

  subject { app }

  it 'Return  multiple jobs links and display it to the user' do
    VCR.use_cassette('jobs_cassette', record: :new_episodes) do
      expect(message: "#{SlackRubyBot.config.user} jobs?", channel: 'jobs').to respond_with_slack_messages([])
    end
  end

  it 'Returns multiple memes images and display it to the user' do
    VCR.use_cassette('memes_cassette', record: :new_episodes) do
      expect(message: "#{SlackRubyBot.config.user} memes?", channel: 'memes').to respond_with_slack_messages([])
    end
  end

  it 'Returns latest ruby articles from hackernoon and display it to the user' do
    VCR.use_cassette('articles_cassette', record: :new_episodes) do
      expect(message: "#{SlackRubyBot.config.user} articles?", channel: 'channel').to respond_with_slack_messages([])
    end
  end

  it 'Returns latest RSS feed from css_tricks website and display it to the user' do
    VCR.use_cassette('css_tricks_cassette', record: :new_episodes) do
      expect(message: "#{SlackRubyBot.config.user} css_tricks?", channel: 'channel').to respond_with_slack_messages([])
    end
  end
end

RSpec.describe WellPaidGeek::Commands::OtherCommands do
  def app
    WellPaidGeek::Bot.instance
  end

  subject { app }
  it 'returns an array of memes from a twitter channel' do
    expect(message: "#{SlackRubyBot.config.user} Hi?", channel: 'memes').to respond_with_slack_messages([])
  end
end
