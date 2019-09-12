class AddLocationIdToUnit < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :location_id, :integer
  end
end
