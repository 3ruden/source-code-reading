require "slack-notify"
require 'clockwork'
require 'dotenv/load'

module Clockwork
  client = SlackNotify::Client.new(webhook_url: ENV['WEBHOOK_URL'])
  handler do |job|
    client.notify(job)
  end

  every(3.minutes, '3分たったよ')
end
