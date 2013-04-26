# Custom prompt magicks
FANCY_PROMPT_CHAR = [0x3299].pack("U*")

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => "\e[0;31m#{FANCY_PROMPT_CHAR} >> \e[0;34m", # Normal prompt
  :PROMPT_S => "\e[0;31m...?\e[0;34m",                     # String continuation prompt
  :PROMPT_C => "\e[0;31m...?\e[0;34m",                     # Statement continuation prompt
  :RETURN   => "\e[0;31m=> %s\n\e[0;34m"                   # Format to return value
}

IRB.conf[:PROMPT_MODE]  = :CUSTOM
IRB.conf[:SAVE_HISTORY] = 1000

# Default hash and array for testing
HASH = {
  :bob => 'Marley', :mom => 'Barley',
  :god => 'Harley', :chris => 'Farley' } unless defined?(HASH)

ARRAY = HASH.keys unless defined?(ARRAY)

# GET TO DA CHOPPA DO IT NAOUGHW (benchmark method)
def go!(&block)
  require 'benchmark'

  result = nil
  timing = Benchmark.realtime do
    result = block.()
  end
  puts "Elapsed time: #{timing * 1000} milliseconds."
  result
end

# Clear the screen
def c
  system 'clear'
end

# Check for balanced parens & brackets
def validate_string(string)
  stack  = []
  lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
  left   = lookup.keys
  right  = lookup.values

  string.each_char do |char|
    if left.include? char
      stack << char
    elsif right.include? char
      return false if stack.empty? || (lookup[stack.pop] != char)
    end
  end

  return stack.empty?
end

# Get methods except for those inherited from Object
class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end

