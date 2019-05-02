# Output strings for 3, 5, 7.
# I was trying to find all the factors here, but I only need to look for those 3.
# That is a fairly large error on my part
class Raindrops
  class << self
    RULES =
      {
        3 => 'Pling',
        5 => 'Plang',
        7 => 'Plong'
    }

    def convert(number, rules = RULES)
      result = drops(number)
      result.empty? ? number.to_s : result
    end

    private

    def drops(number)
      RULES.each_with_object("") do |(factor, sound), result|
        result << drop(number, factor, sound)
      end
    end

    def drop(number, factor, sound)
      number % factor == 0 ? sound : ""
    end
  end
end
