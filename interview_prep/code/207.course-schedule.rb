# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  # DFS the pre-prequisites and stop if we encounter any nodes that are discovered but not processed
  # First construct an adjacency list we can process
  @graph = prerequisites.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(a, b), result| result[a] << b }
  @processed = []
  @discovered = []

  # DFS the adjacency list
  num_courses.times do |n|
    return false if cycle?(n)
  end

  true
end

# DFS from root and
def cycle?(root)
  return true if @discovered[root] && !@processed[root]

  @discovered[root] = true
  @graph[root].each do |adjacent|
    return true if cycle?(adjacent) # Easy way to return early from a recursive call
  end

  @processed[root] = true
  false
end

def can_finish_queue(_num_courses, prerequisites)
  prereq_map = prerequisites.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(a, b), result| result[a] << b }
  pp prereq_map
  # Search each entry in prereq_map for self
  prereq_map.keys.each do |key|
    queue = prereq_map[key]
    until queue.empty?
      current = queue.shift
      puts "map #{prereq_map[current]}"
      return false if prereq_map[current].include?(key)

      queue << prereq_map[current] unless prereq_map[current].empty?
    end
  end

  true
end

def can_finish(_num_courses, prerequisites)
  prereq_map = prerequisites.each_with_object(Hash.new { |h, k| h[k] = [] }) { |(a, b), result| result[a] << b }
  pp prereq_map
  # Search each entry in prereq_map for self
  prereq_map.keys.each do |key|
    queue = prereq_map[key]
    until queue.empty?
      current = queue.shift
      puts "map #{prereq_map[current]}"
      return false if prereq_map[current].include?(key)

      queue << prereq_map[current] unless prereq_map[current].empty?
    end
  end

  true
end

class Node
  attr_accessor :children, :value

  def initialize(value)
    @children = []
    @value = value
  end
end

def build_graph(num_courses, prerequisites)
  graph_map = create_nodes(num_courses)
  prerequisites.each do |a, b|
    graph_map[a].children << graph_map[b]
  end
  graph_map
end

def create_nodes(num_courses)
  num_courses.times.each_with_object({}) do |n, map|
    map[n] = Node.new(n)
  end
end

def can_finish(num_courses, prerequisites)
  graph_map = build_graph(num_courses, prerequisites)
  cycle_free = num_courses.times.map do |n|
    cycle_free(n, graph_map, [])
  end
  cycle_free.all?(true)
end

def cycle_free(num, graph_map, path)
  current = graph_map[num]
  return true if current.nil?

  return false if path.include?(current)

  path << current
  current.children.map { |node| cycle_free(node.value, graph_map, path.dup) }
         .all?(true) && true
end
