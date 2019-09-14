class Clock

  attr_reader :hour, :minute

  # NOTE Start of refactor
  attr_reader :hours, :minutes

  def initialize(hour: 0, minute: 0)
    # First figure out the minute overflow
    @minutes = round_minutes(minute)
    @hour = round_hour(hours) # Must be after round_minute. TODO: Fixme

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

  def -(other)
    self.class.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def <=>(other)
    total_minutes <=> other.total_minutes
  end

  def ==(other)
    (self <=> other).zero?
  end

  def total_minutes
    (hour * 60) + minute
  end

  private

  def round_hour(hour)
    if hour >= 24
      # TODO: Do I need to recurse?
      round_hour(hour % 24)
    end
  end

  def format_hour(hour)
    case hour
    when 0..9
      "0#{hour}"
    when 10..23
      hour.to_s
   # else
   #   format_hour(hour % 24)
    end
  end

  # TODO: Rename minute -> minutes. Globally.
  def round_minutes(minutes)
    if minutes >= 60
      # Division will provide the number of hours
      @hour += (minutes / 60).floor
      # Mod will provide the number of minutes
      # TODO: Will this work?
      round_minutes(minutes % 60)
    else
      minutes
    end
  end

  def format_minute(minute)
    case minute
    when 0..9
      "0#{minute}"
    when 10..59
      minute.to_s
   # else
   #   # Division will provide the number of hours
   #   @hour += (minute / 60).floor
   #   # Mod will provide the number of minutes
   #   format_minute(minute % 60)
    end
  end
end
