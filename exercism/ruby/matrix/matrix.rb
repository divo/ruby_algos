class Matrix
  attr_reader :rows
  attr_reader :columns
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @rows ||= @matrix
      .each_line
      .map { |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
