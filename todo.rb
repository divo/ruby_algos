class TodoList < Array
  def push(story)
    super
    sort!
    reverse!
  end

  def <<(story)
    push story
  end

  def to_s
    self
  end
end

# TODO: Anki this. Can bring it into instance or class depending if it's included or exteneded
# TODO: Can I just have it as data?
module Statuses
  def statuses
    {blocked: 0, active: 1, new: 2, complete: 3, abandoned: 3}
  end
end

module TodoListItem
  extend Statuses # extend statues because of where I use it
  attr_accessor :title, :priority, :status

  # Could also move this to a meta func and call TodoListItem.define_statues_updaters
  # or whatever inside init
  statuses.keys.each do |status|
    # define_method is private so need to use call
    # it's also a class method, so easier to have it out here
    # TODO: Anki this
    # TODO: Lookup the responds_to way and do + Anki that
    send :define_method, "set_status_to_#{status}!".to_sym do
      @status = status
    end
  end

  def initialize(title:, priority:, status: :new)
    @title = title
    @priority = priority

    status = status.downcase.to_sym
    raise ArgumentError unless TodoListItem.statuses.include? status
    @status = status
  end

  def to_s
    "#{status.to_s} #{self.class.name}: #{priority} - #{title}"
  end

  def <=>(other)
    # Need to sort by status and then priority
    statuses = TodoListItem.statuses
    sorted_status = statuses[status] <=> statuses[other.status]
    if sorted_status == 0
      self.priority <=> other.priority
    else
      sorted_status
    end
  end
end

class Story
  include TodoListItem
end

class Bug
  include TodoListItem
  attr_accessor :steps

  # When using keyword args, need to double splat
  def initialize(steps:, **args)
    super args
    raise ArgumentError if steps.empty?
    @steps = steps
  end

  def to_s
    super << " - #{steps}"
  end
end

#todos = TodoList.new
#todos << Story.new(title: 'First Story', priority: 50)
#todos << Story.new(title: 'Second story', priority: 30)
#todos << Bug.new(title: 'Bug', priority: 70, steps: "Do the thing")
#todos.<< Story.new(title: "Nice to have story", priority: 70, status: :active)
#todos.last.set_status_to_blocked!
#puts todos.to_s

todos = TodoList.new
todos.push Story.new(title: "First Story bad status", priority: 50, status: :blocked)
todos.push (abandon_me = Story.new(title: "This can't go yet", priority: 50, status: :blocked))
todos.push (complete_me = Story.new(title: "Second, More Important Story", priority: 30))
todos.push Bug.new(title: "The first story broke this thing", priority: 50, steps: "Add First Story, reload")
todos.push (block_me = Story.new(title: "Nice to have story", priority: 70))
todos.push Story.new(title: "Nice to have story", priority: 40, status: :active)
block_me.set_status_to_blocked!
abandon_me.set_status_to_abandoned!
complete_me.set_status_to_complete!
todos.sort!
todos.push Story.new(title: "Middle of the pack", priority: 40, status: "Abandoned")
puts todos
def assert(bool)
  puts bool ? "OK" : "FAILED"
end
# Test raises Exception when steps are missing
begin
  Bug.new() && assert(false)
rescue Exception
  assert(true)
end
# Test status handles casing
assert Story.new(title: "", priority: "", status: "bLoCked").status.downcase == :blocked
# Test symbol as status
assert Story.new(title: "", priority: "",status: :blocked).status.downcase == :blocked

