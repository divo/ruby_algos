tasks = %i[a a a b b b]
cool_down = 4

def schedule(tasks, cool_down)
  last_seen = Hash.new { tasks.length }
  # All of this is fairly terrible
  result = []
  tasks.each_with_index do |task, index|
    seen_at = (index - last_seen[task]).abs
    # If not seen during cool_down
    if seen_at < cool_down
      result << (['_'] * (cool_down - seen_at)) << [task]
    else
      result << [task] # Just schedule the task
    end
    last_seen[task] = index
  end
  result.flatten.join(', ')
end

puts schedule(tasks, cool_down)

