class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.integer   :kind
      t.string    :name
      t.integer   :price
      t.integer   :feminity_needed
      t.integer   :will_needed
      t.integer   :sub_skill_needed
      t.integer   :modifier

      t.timestamps
    end
  end
end
