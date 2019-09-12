class CreateCharacterRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :character_revisions do |t|
      t.integer :character_id
      t.integer :spd_mod
      t.integer :san_mod
      t.integer :mgt_mod
      t.integer :kno_mod

      t.timestamps
    end
  end
end
