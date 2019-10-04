class AddAttributesToSissies < ActiveRecord::Migration[6.0]
  def change
    add_column :sissies, :surname, :string
    add_column :sissies, :height, :integer
    add_column :sissies, :weight, :integer
    add_column :sissies, :hair_length, :integer
    add_column :sissies, :hair_color, :integer
    add_column :sissies, :eyes_color, :integer
    add_column :sissies, :skin_color, :integer
    add_column :sissies, :penis_size, :integer
    add_column :sissies, :testicles_size, :integer
    add_column :sissies, :breasts_size, :integer
    add_column :sissies, :ass_size, :integer
    add_column :sissies, :lips_size, :integer
    add_column :sissies, :feminity, :integer
    add_column :sissies, :will, :integer
    add_column :sissies, :oral_skill, :integer
    add_column :sissies, :anal_skill, :integer
    add_column :sissies, :sub_skill, :integer
  end
end
