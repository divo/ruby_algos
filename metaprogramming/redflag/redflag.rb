def event(description, &block)
  @events << { description: description, condition: block }
end

# There are now basically globals that get set for every event.
# The book provides a solution to create a shared scope but it's ugly
def setup(&block)
  @state << block
end

def run
  @events.each do |event|
    env = Object.new
    @state.each do |s|
      env.instance_eval(&s)
    end
    puts event[:description] if env.instance_eval(&event[:condition])
  end
end

@events = []
@state = []
load 'events.rb'
run
