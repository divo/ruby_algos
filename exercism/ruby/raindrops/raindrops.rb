module Raindrops
  RULES =
    {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
  }

  def convert(number)
    sound?(number) || number.to_s
  end

  def sound?(number)
    sound = RULES.each_with_object('') do |(factor, sound), result|
      result << sound if (number % factor).zero?
    end
    sound unless sound.empty?
  end
end

Raindrops.extend Raindrops
