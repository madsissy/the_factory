class Player < ApplicationRecord
  # === Constants ===
  TITLES = ['Master', 'Lord', 'Sir', 'Mistress', 'Goddess', 'Princess']

  #  === Relations ===
  belongs_to :user

  # === Enum ===
  enum gender: [:male, :female, :shemale]

  # === Validations ===
  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :gender,    presence: true

  #  === Methods ===
  def full_name
    "#{firstname} #{lastname}"
  end

  def firstname_with_title
    "#{title} #{firstname} #{lastname}"
  end
end
