class Raindrops
  RULES =
    {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
  }

  def self.convert(number)
    new(number).convert
  end

  def initialize(number)
    @number = number
  end

  def convert
    result = RULES.each_with_object('') do |(factor, sound), result|
      result << sound if (@number % factor).zero?
    end
    result.empty? ? @number.to_s : result
  end
end
