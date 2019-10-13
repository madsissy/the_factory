class CreateDayRecaps < ActiveRecord::Migration[6.0]
  def change
    create_table :day_recaps do |t|
      t.integer     :player_id
      t.datetime    :recap_day
      t.integer     :earnings
      t.integer     :losses
      t.integer     :total

      t.timestamps
    end

    add_index :day_recaps, :player_id, unique: true
  end
end
