require_relative '../../yelp-fusion/yelp-api'

class Api::HomeController < ApplicationController
  def yelp
    render json: yelp_search('italian', 'toronto')
  end

  def distance
    # render json:
  end
end
