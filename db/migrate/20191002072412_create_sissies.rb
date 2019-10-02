class CreateSissies < ActiveRecord::Migration[6.0]
  def change
    create_table :sissies do |t|
      t.integer :player_id
      t.string  :firstname
      t.string  :lastname
      t.datetime :birthdate
    end

    add_index :sissies, :player_id
  end
end
