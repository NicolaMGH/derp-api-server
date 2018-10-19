require_relative '../yelp-fusion/yelp-api'

class HomeController < ApplicationController
  def yelp
    render json: yelp_search('spicy', 'toronto')
  end

  def distance
    # render json:
  end
end
