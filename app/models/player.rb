class Player < ApplicationRecord
  TITLES = ['Master', 'Lord', 'Sir', 'Mistress', 'Goddess', 'Princess']

  belongs_to :user

  enum gender: [:male, :female, :shemale]

  def full_name
    "#{firstname} #{lastname}"
  end

  def firstname_with_title
    "#{title} #{firstname} #{lastname}"
  end
end
