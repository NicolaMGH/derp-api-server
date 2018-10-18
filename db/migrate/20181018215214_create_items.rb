class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :info
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
