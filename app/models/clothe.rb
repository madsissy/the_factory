class Clothe < ApplicationRecord
  # === Relation ===
  has_many :sissy_clothes

  # === Enum ===
  enum kind: [:shoes, :outfit, :headgear]

  # === Validations ===
  validates :name,                presence: true
  validates :kind,                presence: true
  validates :modifier,            presence: true

end
