module Channel 
  def self.listen
    inbound = $socket.gets
    puts "<< " << inbound

    # Stay connected to the server
    if inbound.match(/^PING (.*)$/)
      Message.send "PONG #{$1}"
    end

    if inbound.match(/PRIVMSG ##{$channel} (.*)$/)
      content = $1
      # Ruben will close the connection when any user types !QUIT
      if content.match(/(?:!QUIT)/)
        leave
      end
      if content.match(/(?:hi|hello|hey)\s*,?\s*(?:ruben)/i)
        Hello.hello
      end
      if content.match(/(?:what\s*time)/i)
        Message.say "Right now it's #{Time.now.localtime.strftime("%H:%M:%S %p")}."
      end
    end

    if inbound.match(/^:(.*)!(.*) JOIN ##{$channel}/)
      $name = $1
      Greet.greet
    end
  end

  def self.leave
    Message.say "Goodbye!"
    Message.send "PART ##{$channel} :Ruben out"
    Message.send "QUIT"
  end
end
