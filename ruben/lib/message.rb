module Message
  # Communicates with the server
  def self.send msg
    $socket.puts msg
    puts ">> " << msg
  end

  # Communicates with users in a channel
  def self.say msg
    send "PRIVMSG ##{$channel} :#{msg}"
  end
end
