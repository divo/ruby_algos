# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
class Node
  attr_accessor :children
  attr_accessor :value

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

