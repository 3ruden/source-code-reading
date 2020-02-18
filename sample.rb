require "slack-notify"
require 'clockwork'
require 'dotenv/load'

module Clockwork
  client = SlackNotify::Client.new(webhook_url: ENV['WEBHOOK_URL'])
  handler do |job|
    client.notify(job)
  end

  every(10.seconds, '10秒たったよ')
  every(3.minutes, '3分たったよ')
  every(1.hour, '1時間たったよ')
  every(1.day, '1日たったよ', :at => '00:00')
end
