def network_delay_time(times, n, k)
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

