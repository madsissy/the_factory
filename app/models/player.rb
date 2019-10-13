class Player < ApplicationRecord
  # === Constants ===
  TITLES = ['Master', 'Lord', 'Sir', 'Mistress', 'Goddess', 'Princess']

  #  === Relations ===
  belongs_to :user
  has_many   :sissies
  has_many   :items
  has_one    :factory
  has_one    :house
  has_one    :day_recap
  has_one    :weapon, -> { weapon.order('modifier DESC').limit(1) }, class_name: 'Item'

  # === Enum ===
  enum gender: [:male, :female, :shemale]

  # === Validations ===
  validates :firstname, presence: true
  validates :lastname,  presence: true
  validates :gender,    presence: true
  validates_numericality_of :energy,       greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_numericality_of :seduction,    less_than_or_equal_to: 100
  validates_numericality_of :intimidation, less_than_or_equal_to: 100

  #  === Methods ===
  def full_name
    "#{firstname} #{lastname}"
  end

  def firstname_with_title
    "#{title} #{firstname} #{lastname}"
  end

  def enough_energy? energy_needed
    energy >= energy_needed
  end

  def enough_fund? fund_needed
    wallet_amount >= fund_needed
  end
end
