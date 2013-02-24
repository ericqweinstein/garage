IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000

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

  def nihil?
    if respond_to? :empty?
      empty?
    elsif respond_to? :zero?
      zero?
    else
      !self
    end
  end
end

