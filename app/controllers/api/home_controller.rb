require_relative '../../yelp-fusion/yelp-api'
require_relative '../../helpers/itinerary_builder'

class Api::HomeController < ApplicationController
  def yelp
    render json: yelp_search('italian', 'toronto')
  end

  def distance
    # render json:
  end


end
