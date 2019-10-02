class Sissy < ApplicationRecord
  # === Constants ===

  #  === Relations ===
  belongs_to :player

  # === Enum ===

  # === Validations ===

  #  === Methods ===
  def full_name
    "#{firstname} #{lastname}"
  end

end
