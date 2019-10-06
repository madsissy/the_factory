class AddLocationToSissies < ActiveRecord::Migration[6.0]
  def change
    add_column :sissies, :location, :integer

    add_index :sissies, :location
  end
end
