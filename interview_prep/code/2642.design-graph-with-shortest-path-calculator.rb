class Graph
  #     :type n: Integer
  #     :type edges: Integer[][]
  attr_accessor :n, :edges

  def initialize(n, edges)
    @n = n
    @edges = edges
  end

  #     :type edge: Integer[]
  #     :rtype: Void
  def add_edge(edge)
    # Check if edge exists before adding
    adjacency = build_adj_list
    from, to, = edge
    return false if adjacency[from].any? { |(dest, _cost)| dest == to }

    @edges << edge
  end

  #     :type node1: Integer
  #     :type node2: Integer
  #     :rtype: Integer
  def shortest_path(node1, node2)
    adjacent = build_adj_list
    heap = Containers::MinHeap.new
    heap.push(0, node1)
    distances = [1_000_000_000] * @n
    distances[node1] = 0

    until heap.empty?
      distance = heap.next_key
      node = heap.pop

      return distance if node == node2

      adjacent[node].each do |end_vertex, dist|
        new_dist = distance + dist
        if new_dist < distances[end_vertex]
          distances[end_vertex] = new_dist
          heap.push(new_dist, end_vertex)
        end
      end
    end

    -1
  end

  def shortest_path_attemp1(node1, node2)
    # Dijkstras
    result = 0 # Path cost
    visited = []
    # Build adjaceny list, list of edges with cost indexed by node
    adjacent = build_adj_list
    # Heap to keep track of next closest node
    # Start with node1, use cost as key and edge as value
    # Push on first node with 0 cost because we start from there
    heap = Containers::MinHeap.new
    heap.push(0, node1)

    # Dequeue from the heap until there are no more nodes or we reach destination
    puts 'sp'
    while visited.count < @edges.count
      cost = heap.next_key
      current = heap.pop

      return -1 if cost.nil?

      next if visited.include?(current)

      result += cost
      visited << current
      puts "#{visited}: #{current}: #{result}"
      return result if current == node2

      # Enqueue all the adjacent nodes for next step
      heap = Containers::MinHeap.new
      adjacent[current].each { |dest, cost| heap.push(cost, dest) }
    end

    -1 # -1 if we don't find the destination in our path
  end

  private

  def build_adj_list
    # Walk @edges creating list: [from] = [to, cost]
    @edges.each_with_object(Array.new(@n) { [] }) do |(from, to, cost), adjacent|
      adjacent[from] << [to, cost]
    end
  end
end

# Your Graph object will be instantiated and called as such:
# obj = Graph.new(n, edges)
# obj.add_edge(edge)
# param_2 = obj.shortest_path(node1, node2)

