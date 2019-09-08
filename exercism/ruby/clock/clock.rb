class Clock

  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    minute = format_minute(@minute)
    "#{format_hour(@hour)}:#{minute}"
  end

  def +(other)
    self.class.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  private

  def format_hour(hour)
    case hour
    when 0..9
      "0#{hour}"
    when 10..23
      hour.to_s
    else
      format_hour(hour % 24)
    end
  end

  def format_minute(minute)
    case minute
    when 0..9
      "0#{minute}"
    when 10..59
      minute.to_s
    else
      # Division will provide the number of hours
      @hour += (minute / 60).floor
      # Mod will provide the number of minutes
      format_minute(minute % 60)
    end
  end
end
