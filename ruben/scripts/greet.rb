module Greet
  # Greet people as they enter the channel
  def self.greet
    Message.say "Welcome back, #{$name}!" unless $name == "ruben_"
  end
end
