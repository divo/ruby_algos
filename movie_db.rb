require 'URI'
require 'net/http'
require 'json'

class MovieClient
  # https://api.themoviedb.org/3/movie/popular?api_key=742d29b3241cd6edaf6344106c85233f&page=1
  def build_popular_url
    uri = URI('https://api.themoviedb.org/3/movie/popular')
    params = { :api_key => "742d29b3241cd6edaf6344106c85233f", :page => 1 }
    uri.query = URI.encode_www_form(params)
    uri
  end

  def fetch_popular_movies
    res = Net::HTTP.get_response(build_popular_url)
    res if res.is_a?(Net::HTTPSuccess)
  end
end

class Movies
  attr_reader :popular
  def initialize(movies_string)
    @popular = JSON.parse(movies_string)["results"] # Need to parse string from net to JSON dict
    # with_indifferent_access is a rails thing
  end
end

client = MovieClient.new()
body = client.fetch_popular_movies.body
movies = Movies.new(body)
puts movies.popular.first
