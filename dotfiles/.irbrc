IRB.conf[:PROMPT_MODE] = :SIMPLE

HASH = {
  :bob => 'Marley', :mom => 'Barley',
  :god => 'Harley', :chris => 'Farley' } unless defined?(HASH)

ARRAY = HASH.keys unless defined?(ARRAY)

def go!(&block)
  require 'benchmark'

  result = nil
  timing = Benchmark.realtime do
    result = block.()
  end
  puts "Elapsed time: #{timing * 1000} milliseconds."
  result
end

def c
  system 'clear'
end

class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end
