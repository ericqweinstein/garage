#!/usr/bin/env ruby

require 'socket'

# Load libraries
Dir["./lib/*.rb"].each { |file| require file }
# Load scripts
Dir["./scripts/*.rb"].each { |file| require file }

# TODO: Refactor out global variables

class Ruben
  def initialize(server, port, channel)
    $socket  = TCPSocket.open(server, port)
    $channel = channel
    @nick    = "ruben_"
  end

  def run
    # Connect to IRC
    Message.send "USER ruben 0 * :Ruben"
    Message.send "NICK #{@nick}"
    Message.send "JOIN ##{$channel}"

    # Event loop
    until $socket.eof? do
      Channel.listen
    end
  end
end

ruben = Ruben.new("irc.freenode.net", 6667, "test_chan")

# Ensures Ruben leaves politely when ^C-ed
trap("INT") { Channel.leave }

ruben.run
