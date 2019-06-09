module Status
  STATUSES = {ok: 1, error: 2}
end

class Response
  include Status
  def initialize(status)
    raise unless STATUSES.include? status
  end
end

response = Response.new(:ok)
#response = Response.new(:crap) # Raises
