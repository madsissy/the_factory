class AddAttributesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :seduction, :integer
    add_column :players, :intimidation, :integer
  end
end
