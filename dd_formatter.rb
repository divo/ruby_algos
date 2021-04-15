# Dumb little script to take datadog table output transform to CSV
class String
  def <<(s)
    self.concat(s.strip)
  end
end

CR = "\n"
lines = File.readlines(ARGV.first)
output = ""
output << lines[0] << ',' << lines[1]
output.concat(CR)
# Need to use concat to avoid the shovle bullshit
output << 'total,' << lines[2]
output.concat(CR)
lines[3..].each_slice(2) do |entry|
  output << entry.first << ',' << entry.last
  output.concat(CR)
end

File.write("#{ARGV.first}-out", output)


