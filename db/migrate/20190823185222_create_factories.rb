class CreateFactories < ActiveRecord::Migration[6.0]
  def change
    create_table :factories do |t|
      t.integer :player_id
      t.integer :level
    end

    add_index :factories, :player_id
  end
end
