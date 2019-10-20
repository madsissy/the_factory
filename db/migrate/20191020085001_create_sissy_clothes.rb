class CreateSissyClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :sissy_clothes do |t|
      t.integer :sissy_id
      t.integer :clothe_id
      t.integer :player_id
    end

    add_index :sissy_clothes, :player_id
    add_index :sissy_clothes, :sissy_id
    add_index :sissy_clothes, :clothe_id
  end
end
