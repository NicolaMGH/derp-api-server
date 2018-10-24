require_relative '../helpers/itinerary_builder'

class ItinerariesController < ApplicationController
  def create
    puts params
    result = generate_itinerary(params)
    # puts "Result #{result}"
    render json: result
  end
end
