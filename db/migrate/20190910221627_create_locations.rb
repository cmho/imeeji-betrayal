class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :location_north_id
      t.integer :location_south_id
      t.integer :location_west_id
      t.integer :location_east_id
      t.integer :location_up_id
      t.integer :location_down_id
      t.boolean :discovered

      t.timestamps
    end
  end
end
