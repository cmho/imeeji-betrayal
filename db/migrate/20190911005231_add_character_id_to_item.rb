class AddCharacterIdToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :character_id, :integer
  end
end
