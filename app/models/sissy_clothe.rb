class SissyClothe < ApplicationRecord
  # === Relation ===
  belongs_to :clothe
  belongs_to :player
  belongs_to :sissy, optional: true

  # === Scopes ===
  scope :headgear,    -> { joins(:clothe).where(clothes: { kind: 'headgear'} ) }
  scope :outfit,      -> { joins(:clothe).where(clothes: { kind: 'outfit'} ) }
  scope :shoes,       -> { joins(:clothe).where(clothes: { kind: 'shoes'} ) }
  scope :unweared,    -> { where(sissy_id: nil) }

  # === Methods ===
  def self.item_scope attribute
    case attribute
    when :headgear  then headgear
    when :outfit    then outfit
    when :shoes     then shoes
    end
  end
end
