class CreateJoinTableCharactersRuns < ActiveRecord::Migration[5.1]
  def change
    create_join_table :characters, :runs
  end
end
