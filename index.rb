#!/usr/bin/env ruby
require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.hackint.org"
    c.channels = ["##hack-adm"]
    c.nick = "beamerbot"
  end


  on :channel, /bb vlc (.*)/i do |m|
    error = `cvlc #{m.message.split.last}`
    if error
      m.reply error
    else
      m.reply "now playing"
    end
  end
end

bot.start
