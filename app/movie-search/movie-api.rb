require 'net/http'
require 'net/https'
require 'dotenv'
Dotenv.load

def get_movies_by_location(coordinates)
  uri = URI("https://api.internationalshowtimes.com/v4/showtimes/?location=#{coordinates[0]},#{coordinates[1]}")

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Create Request
  req =  Net::HTTP::Get.new(uri)
  # Add headers
  req.add_field "X-API-Key", ENV['API_KEY']

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"

  res.body
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
  req.add_field "X-API-Key", ENV['API_KEY']

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"

  res.body
end


# get_movies_by_location([43.65,-79.38])
get_movie_details(46257)