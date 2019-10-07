class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :name
      t.integer   :kind
      t.integer   :quantity
      t.integer   :modifier
      t.string    :modified_attribute
      t.integer   :price
      t.integer   :player_id

      t.timestamps
    end

    add_index :items, :player_id
  end
end
