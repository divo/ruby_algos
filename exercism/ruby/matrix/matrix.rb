class Matrix
  attr_reader :rows
  attr_reader :columns
  def initialize(string)
    @rows = compute_rows string
    @columns = compute_cols @rows
  end

  def compute_rows(string)
    string
      .split(/\n/)
      .map { |row| row.split(' ').map(&:to_i) }
  end

  def compute_cols(rows)
    result = []
    rows.first.each_index do |index|
      col = []
      rows.map do |row|
        col.push row[index]
      end
      result.push col
    end
    result
  end
end
