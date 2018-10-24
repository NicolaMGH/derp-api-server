require 'net/http'
require 'net/https'
require 'dotenv'
require 'json'
require 'time'
Dotenv.load

def get_movies_by_location(coordinates)
  uri = URI("https://api.internationalshowtimes.com/v4/showtimes/?location=#{coordinates['lat']},#{coordinates['lng']}")

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Create Request
  req =  Net::HTTP::Get.new(uri)
  # Add headers
  req.add_field "X-API-Key", ENV['MOVIE_KEY']

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  # puts "Response HTTP Response Body: #{res.body}"
  return res.body
  rescue StandardError => e
    puts "HTTP Request failed (#{e.message})"
end


def get_movie_details(movie_id)
    uri = URI("https://api.internationalshowtimes.com/v4/movies/#{movie_id}")
  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Create Request
  req =  Net::HTTP::Get.new(uri)
  # Add headers
  req.add_field "X-API-Key", ENV['MOVIE_KEY']

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"

  res.body
end

def random_movie(movies, start_time, end_time)
  parsed = JSON.parse(movies)
  movie = parsed["showtimes"][rand(0...parsed["showtimes"].length)]
  parsed_time = Time.parse(movie["start_at"])

  i = 0
  while !((start_time < parsed_time) && (parsed_time < end_time))
    i += 1
    if i > 10000
      return 'Not matching movie found.'
    end
    movie = parsed["showtimes"][rand(0...parsed["showtimes"].length)]
    parsed_time = Time.parse(movie["start_at"])
  end
  movie
end

coords = {"lng"=> -79.3951258, "lat"=>43.6444143}
movies = get_movies_by_location(coords)

puts movies

# get_movie_details(46257)
puts random_movie(movies, Time.parse("2018-10-24T21:15:00-04:00"), Time.parse("2018-10-24T23:15:00-04:00") )
