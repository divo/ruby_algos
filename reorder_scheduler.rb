tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"]
n = 2

def least_interval(tasks, n)
  tasks = tasks.dup
  result = []
  position = 0
  last_seen = {}
  loop do
    return result.count if tasks.empty?

    sorted_tasks = sorted_counts(tasks)

    until sorted_tasks.empty?
      task = sorted_tasks.shift
      name = task.keys.first
      seen_at = last_seen[name]
      if seen_at == nil || position - seen_at.next >= n
        # Schedule it
        tasks.delete_at(tasks.index(name))
        result << name
        last_seen[name] = position
        break
      elsif position - seen_at.next < n # Next to account for array
        if sorted_tasks.empty?
          result << "_"
        end
        # If not enough time has gone by go again
      end
    end
    position += 1
  end
end


def sorted_counts(tasks)
  groups = tasks.group_by(&:to_s)
  counts = groups.map { |key, val| { key => val.size } }
  counts.sort_by { |_, val| val }
end

puts least_interval(tasks, n)
