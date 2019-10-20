class SissyClothe < ApplicationRecord
  # === Relation ===
  belongs_to :clothe
  belongs_to :player
  belongs_to :sissy, optional: true

end
