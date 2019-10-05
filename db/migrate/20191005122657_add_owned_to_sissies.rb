class AddOwnedToSissies < ActiveRecord::Migration[6.0]
  def change
    add_column :sissies, :owned, :boolean, default: false
  end
end
