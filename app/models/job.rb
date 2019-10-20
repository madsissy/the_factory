class Job < ApplicationRecord
  # === Relation ===
  has_many :sissy_jobs

  # === Validations ===
  validates :name,                presence:   true
  validates :will_needed,         presence:   true
  validates :sub_skill_needed,    presence:   true
  validates :name,                uniqueness: true

end
