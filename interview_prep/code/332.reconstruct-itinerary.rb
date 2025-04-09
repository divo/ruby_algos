def find_itinerary(tickets)
  adj_list = Hash.new { |h, k| h[k] = [] }
  tickets.each do |from, to|
    # adj_list[from] << [to, to.chars.map(&:ord)]
    adj_list[from] << to
  end

  visited = {}
  result = []
  total_cost = 0
  heap = Containers::Heap.new
  heap.push('JFK', 0)
  until heap.empty?
    node = heap.next_key
    cost = heap.pop
    result << node
    total_cost += cost
    adj_list[node].each do |adj_node|
      next if visited[node + adj_node]

      heap.push(adj_node, total_cost + weight(adj_node))
      visited[node + adj_node] = true
    end
  end

  result
end

def weight(input)
  input.chars.map(&:ord).sum
end

