# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
# Had to look at solution
def find_order(num_courses, prerequisites)
  @graph = prerequisites.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(a, b), result| result[a] << b }
  pp @graph

  @result = []
  @processed = []
  @discovered = []

  num_courses.times.each do |n|
    return [] unless dfs(n)
  end

  @result
end

def dfs(course)
  puts "dfs #{course}"
  return false if @discovered[course] && !@processed[course]

  return true if @processed[course] # Don't re-process nodes

  @discovered[course] = true
  @graph[course].each do |n|
    # If we find a cycle, exit the DFS immediatly, else continue
    return false unless dfs(n)
  end
  @processed[course] = true
  @result << course
  true
end

def find_order_mine(num_courses, prerequisites)
  # Topological sort of directed graph
  graph = prerequisites.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(a, b), result| result[a] << b }
  start = graph.max_by { |_k, v| v.length } || [0]
  pp graph

  result = catch(:cycle) do
    sort(start.first, graph)
  end
  return [] unless result

  pp result

  # Add any courses with out prerequisites to the end of the schedule
  num_courses.times do |n|
    result << n unless result.include?(n)
  end

  result
end

def sort(root, graph, processed = [], discovered = [], result = [])
  puts "dfs #{root}"
  if discovered[root] && !processed[root]
    # Cycle detected
    throw :cycle
  end

  discovered[root] = true
  graph[root].each do |n|
    sort(n, graph, processed, discovered, result)
  end

  result << root unless processed[root]
  puts "mark as procesed #{root}"
  processed[root] = true

  result
end
