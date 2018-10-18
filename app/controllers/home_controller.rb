require_relative '../yelp-fusion/yelp-api'

class HomeController < ApplicationController
  def test
    render json: yelp_search('spicy', 'mississauaga')
  end
end
