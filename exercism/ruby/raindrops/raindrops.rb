# Output strings for 3, 5, 7.
# I was trying to find all the factors here, but I only need to look for those 3.
# That is a fairly large error on my part
class Raindrops
  def self.convert(no)
    result = ""
    if no % 3 == 0
      result += "Pling"
    end

    if no % 5 == 0
      result += "Plang"
    end

    if no % 7 == 0
      result += "Plong"
    end

    result == "" ? "#{no}" : result
  end

  private

  def drop(factor, no, sound)
    if no % factor == 0
      sound
    end
  end
end
