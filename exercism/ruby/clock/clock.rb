class Clock
  def initialize(hour: 0, minutes: 0)
    @hour = hour
    @minutes = minutes
  end

  def to_s
    hour = @hour < 10 ? "0#{@hour}" : "#{@hour}"
    minutes = @minutes < 10 ? "0#{@minutes}" : "#{@minutes}"

    "#{hour}:#{minutes}"
  end
end
