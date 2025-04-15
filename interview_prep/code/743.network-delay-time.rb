# Want to find the shortest path between all nodes
# That means we need to use Dijkstras, a BFS algo
# Build the graph, where ex. {2} = [[1, 1], [3, 1]], node = [dest, cost] pairs
# Start at k and BFS search all nodes using a heap to find the next cheapest path
# Stop when we have visited all the nodes
def network_delay_time(times, n, k)
  graph = times.each_with_object(Hash.new { |h, k| h[k] = [] }) do |(source, dest, cost), result|
    # Example graph 2 = [[1, 1], [3, 1]]
    result[source] << [dest, cost]
  end

  distances = [1_000] * (n + 1)
  distances[k] = 0
  visited = []
  heap = Containers::MinHeap.new
  heap.push(0, k)
  total = 0

  until heap.empty?
    total_cost = heap.next_key
    node = heap.pop
    next if visited.include?(node)

    visited << node
    total = [total, total_cost].max

    graph[node].each do |dest, cost|
      new_cost = cost + total_cost
      if new_cost < distances[dest]
        distances[dest] = new_cost
        heap.push(new_cost, dest)
      end
    end
  end

  return total if visited.length == n

  -1
end

def network_delay_time_failed(times, n, k)
  @graph = times.each_with_object(Hash.new { |h, k| h[k] = [] }) do |(source, dest, cost), result|
    # Example graph 2 = [[1, 1], [3, 1]]
    result[source] << [dest, cost]
  end

  @result = 0
  @discovered = []
  @processed = []

  dfs(k, 0)
  pp @result

  return -1 unless @processed.count == n

  @result
end

def dfs(node, total_cost)
  @discovered << node
  @graph[node].each do |dest, cost|
    next if @discovered.include?(dest) && !@processed.include?(dest)

    dfs(dest, total_cost + cost)
  end
  @processed << node
  @result = [@result, total_cost].max
end

