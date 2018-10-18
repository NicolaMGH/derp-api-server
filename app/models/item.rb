class Item < ApplicationRecord
  belongs_to :itinerary
  validate :info, presence: true
end
