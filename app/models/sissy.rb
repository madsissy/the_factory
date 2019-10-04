class Sissy < ApplicationRecord
  # === Constants ===

  #  === Relations ===
  belongs_to :player

  # === Enum ===

  # === Validations ===
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :birthdate
  validates_presence_of :height
  validates_presence_of :weight
  validates_presence_of :hair_length
  validates_presence_of :hair_color
  validates_presence_of :eyes_color
  validates_presence_of :skin_color
  validates_presence_of :penis_size
  validates_presence_of :testicles_size
  validates_presence_of :breasts_size
  validates_presence_of :ass_size
  validates_presence_of :lips_size
  validates_presence_of :feminity
  validates_presence_of :will
  validates_presence_of :oral_skill
  validates_presence_of :anal_skill
  validates_presence_of :sub_skill

  validates_numericality_of :height,      in: 150..190
  validates_numericality_of :weight,      in: 50..120
  validates_numericality_of :hair_length, in: 0..120
  validates_numericality_of :penis_size,  in: 1..30
  validates_numericality_of :feminity,    in: 0..100
  validates_numericality_of :will,        in: 0..100
  validates_numericality_of :oral_skill,  in: 0..100
  validates_numericality_of :anal_skill,  in: 0..100
  validates_numericality_of :sub_skill,   in: 0..100

  #  === Methods ===
  def full_name
    "#{firstname} #{lastname}"
  end

end
