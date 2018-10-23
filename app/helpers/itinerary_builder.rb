# This is a helper file that parses API info according to user arguments
require_relative "./yelp-fusion/yelp-api"
require_relative "./movie-search/movie-api"
require_relative "./google-distance/google-direction"
# Given an object of arguments, return an itinerary JSON object.

def generate_intinerary(info)
  coord = info.coord
  start_time = info.start_time
  end_time = info.end_time
  time_frame = end_time - start_time
  itinerary = []

  info.order.each do |type|
    case type
    when 'Restaurant'
      itinerary << yelp_search(coord)
    when 'Movie'
      #movie api
      movies = get_movies_by_location(params[:location])
      itinerary << random_movie(movies, start_time, end_time)
    else
      #invalid type
    end
  end
end

# Use the google map API to get the route information for the itinerary
def get_route(itinerary)
  itinerary.each do |item|
    #concat to query string
  end
  #make query to google map API
end
