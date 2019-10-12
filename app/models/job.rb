class Job < ApplicationRecord
  # === Validations ===
  validates :name,                presence: true
  validates :will_needed,         presence: true
  validates :sub_skill_needed,    presence: true

end
