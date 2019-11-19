def event(description, &block)
  @events << { description: description, condition: block }
end

def setup(&block)
  @env << block
end

def run
  @events.each do |event|
    @env.each(&:call)
    puts event[:description] if event[:condition].call
  end
end

@events = []
@env = []
load 'events.rb'
run
