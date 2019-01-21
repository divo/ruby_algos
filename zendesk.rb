require 'net/http'
require 'json'

def uri
  URI('http://support.zd-dev.com/api/v2/requests.json')
end

def fetch_tickets
  uri = uri()
  req = Net::HTTP::Get.new(uri)
  req.basic_auth 'admin@zd-dev.com', '123456'
  Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end
end

def create_ticket
  uri = uri()
  header = {'Content-Type': 'application/json'} # This was the important bit
  req = Net::HTTP::Post.new(uri, header)
  req.basic_auth 'admin@zd-dev.com', '123456'
  body = {request: { subject: "test", comment: { body: "This is a test"}}}
  req.body = body.to_json
  Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end
end

puts fetch_tickets.body
#puts create_ticket.code
