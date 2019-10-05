class AddAttractivenessToSissies < ActiveRecord::Migration[6.0]
  def change
    add_column :sissies, :attractiveness, :integer
  end
end
