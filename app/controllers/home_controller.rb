require_relative '../yelp-fusion/yelp-api'
require_relative '../google-distance/routes'

class HomeController < ApplicationController
  def yelp
    render json: yelp_search('spicy', 'mississauaga')
  end

  def distance
    render json: get_route
  end
end
