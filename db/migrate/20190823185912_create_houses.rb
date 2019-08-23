class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.integer :player_id
      t.integer :level
    end

    add_index :houses, :player_id
  end
end
