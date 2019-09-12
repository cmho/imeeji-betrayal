class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :username
      t.integer :unit_id
      t.integer :stat_build_id
      t.integer :speed
      t.integer :might
      t.integer :knowledge
      t.integer :sanity
      t.integer :discovery_points
      t.integer :location_id
      t.boolean :traitor
      t.timestamps
    end
  end
end
