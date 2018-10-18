class Itinerary < ApplicationRecord
  belongs_to :users
  has_many :items
  validate :name, presence: true
end
