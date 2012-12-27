module Message
  # Communicates with the server
  def Message.send msg
    $socket.puts msg
    puts ">> " << msg
  end

  # Communicates with users in a channel
  def Message.say msg
    send "PRIVMSG ##{$channel} :#{msg}"
  end
end
