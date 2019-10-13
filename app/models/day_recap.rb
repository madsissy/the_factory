class DayRecap < ApplicationRecord
  #  === Relations ===
  belongs_to :player

  #  === Validations ===
  validates_presence_of :recap_day
end
