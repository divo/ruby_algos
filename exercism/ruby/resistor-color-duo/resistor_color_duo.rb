class ResistorColorDuo
  VALUES = {
    Black: 0,
    Brown: 1,
    Red: 2,
    Orange: 3,
    Yellow: 4,
    Green: 5,
    Blue: 6,
    Violet: 7,
    Grey: 8,
    White: 9
  }

  def self.value(colors)
    colors.map { |value| VALUES[value.capitalize.to_sym] }
      .join
      .to_i
  end
end
