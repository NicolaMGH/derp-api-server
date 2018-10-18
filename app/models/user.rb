class User < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :itineraries
  validate :name, :pasword_digest presence: true

end
