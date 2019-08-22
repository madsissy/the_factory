class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer   :user_id
      t.datetime  :current_date
      t.integer   :wallet_amount
      t.integer   :energy

      t.timestamps
    end

    add_index :players, :user_id
  end
end
