class CreateStatBuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :stat_builds do |t|
      t.string :name
      t.integer :spd_1
      t.integer :spd_2
      t.integer :spd_3
      t.integer :spd_4
      t.integer :spd_5
      t.integer :spd_6
      t.integer :spd_7
      t.integer :spd_8
      t.integer :san_1
      t.integer :san_2
      t.integer :san_3
      t.integer :san_4
      t.integer :san_5
      t.integer :san_6
      t.integer :san_7
      t.integer :san_8
      t.integer :mgt_1
      t.integer :mgt_2
      t.integer :mgt_3
      t.integer :mgt_4
      t.integer :mgt_5
      t.integer :mgt_6
      t.integer :mgt_7
      t.integer :mgt_8
      t.integer :kno_1
      t.integer :kno_2
      t.integer :kno_3
      t.integer :kno_4
      t.integer :kno_5
      t.integer :kno_6
      t.integer :kno_7
      t.integer :kno_8
      t.integer :spd_default
      t.integer :san_default
      t.integer :mgt_default
      t.integer :kno_default

      t.timestamps
    end
  end
end
