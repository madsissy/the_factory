class Item < ApplicationRecord
  #  === Relations ===
  belongs_to :player

  # === Enum ===
  enum kind: [:weapon, :drug]

  # === Validations ===
  validates :name,                presence: true
  validates :kind,                presence: true
  validates :quantity,            presence: true
  validates :modifier,            presence: true
  validates :modified_attribute,  presence: true

end
