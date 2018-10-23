require "json"
require "http"
require "optparse"
require 'dotenv'
Dotenv.load
GOOGLE_URI = "https://maps.googleapis.com/maps/api/directions/json?"
KEY = "&key=#{ENV['GOOGLE_KEY']}"


def get_route(locations)
  # Get origin and destination
  origin = locations[0]
  ori = "origin=#{origin['lat']},#{origin['lon']}"
  destination = locations[-1]
  dest = "&destination=#{origin['lat']},#{origin['lon']}"
  # Get way points
  wp = ""
  waypoints = []
  if locations.length > 2
    waypoints = locations.slice(1...locations.length - 1)
    wp = "&waypoints="
  end
  waypoints.each_index do |i|
    if  i == 0
      wp << "#{waypoints[i]['lat']},#{waypoints[i]['lon']}"
    else
      wp << "|#{waypoints[i]['lat']},#{waypoints[i]['lon']}"
    end
  end

  # Send API request to google with built URL
  resp = HTTP.get("#{GOOGLE_URI}#{ori}#{dest}#{wp}#{KEY}")
  resp.parse
end

puts get_route [{"lat" => 43.6533096, "lon" => -79.380774}, {"lat" => 45.50884, "lon" => -73.58781}]