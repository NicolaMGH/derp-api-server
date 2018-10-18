class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
