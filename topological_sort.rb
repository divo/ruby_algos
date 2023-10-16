tasks = [[1, 0], [2, 0], [3, 1], [3, 2]]

def topological_sort(tasks)
  @unvisited = tasks.dup
  until @unvisited.empty?
    visit(@unvisited.first)
  end
end

def visit(task)
  return unless @unvisited.include?(task) # Return if visited
end


def dfs(nodes, node)

end
