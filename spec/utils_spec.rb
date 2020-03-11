require_relative '../lib/utils.rb'
require 'rspec'
require 'slack-ruby-bot'

class TestClass < SlackRubyBot::Commands::Base
    command 'jobs?' do |client, data, match|
        command_body('https://stackoverflow.com/jobs/feed', 'Good Luck with your job search', client, data, match)
      end
end

describe SlackRubyBot::Commands do
    let(:app) { Server.new }
    let(:client) { app.send(:client) }
    let(:message_hook) { SlackRubyBot::Hooks::Message.new }
    it 'receives a typing event' do
        expect(client).to receive(:typing)
        message_hook.call(
          client,
          Hashie::Mash.new(text: "#{SlackRubyBot.config.user} type something", channel: 'channel')
        )
      end
    end
  end

