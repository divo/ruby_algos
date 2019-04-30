# Output strings for 3, 5, 7.
# I was trying to find all the factors here, but I only need to look for those 3.
# That is a fairly large error on my part
class Raindrops
  RAINDROPS = [[3, "Pling"], [5, "Plang"], [7, "Plong"]]

  def self.convert(no)
    result = get_drops(no)
    result == "" ? "#{no}" : result
  end

  # Convert looks a lot nicer but simple_convert is immediately understandable.
  def self.simple_convert(no)
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

  def self.get_drops(no)
    RAINDROPS.inject("") do |result, (factor, sound)|
      result += drop(no, factor, sound)
    end
  end

  def self.drop(no, factor, sound)
    no % factor == 0 ? sound : ""
  end
end
