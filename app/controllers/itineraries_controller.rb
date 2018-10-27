require_relative '../helpers/itinerary_builder'

class ItinerariesController < ApplicationController
  def create

    result = {}
    # puts params
    result[:itinerary] = generate_itinerary(params)
    result[:google_directions] = create_route(result[:itinerary])

    @itinerary = Itinerary.create(name: "Kelvin", user_id: session[:user_id])
    result[:itinerary].map do |info|
      @itinerary.items.create(info: info)
    end

    render json: result

  end
end
