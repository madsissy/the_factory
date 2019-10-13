class AddUpkeepToFactories < ActiveRecord::Migration[6.0]
  def change
    add_column :factories, :upkeep, :integer
  end
end
