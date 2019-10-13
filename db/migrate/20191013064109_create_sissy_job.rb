class CreateSissyJob < ActiveRecord::Migration[6.0]
  def change
    create_table :sissy_jobs do |t|
      t.integer :sissy_id
      t.integer :job_id
      t.integer :experience
      t.boolean :current_job
    end

    add_index :sissy_jobs, :sissy_id
    add_index :sissy_jobs, :job_id
  end
end
