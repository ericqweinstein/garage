module Greet
  # Greet people as they enter the channel
  def Greet.greet
    Message.say "Welcome back, #{$name}!" unless $name == "ruben_"
  end
end
