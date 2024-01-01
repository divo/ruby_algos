# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
  s.sort!
  g.sort.reduce(0) do |res, num|
    if (cookie = s.find { |c| num <= c })
      s.slice!(s.index(cookie))
      res += 1
    end
    res
  end
end


