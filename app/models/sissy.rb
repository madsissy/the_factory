class Sissy < ApplicationRecord
  # === Constants ===

  #  === Relations ===
  belongs_to :player

  # === Enum ===
  enum hair_color:      [:blond, :platinum_blond, :brown, :dark_brown, :jet_black, :ginger, :red, :pink, :green, :blue]
  enum eyes_color:      [:brown, :black, :green, :blue, :grey]
  enum skin_color:      [:pale, :olive, :tanned, :black]
  enum testicles_size:  [:micro, :small, :big, :huge]
  enum breasts_size:    [:no_breasts, :a_cup, :b_cup, :c_cup, :d_cup, :e_cup, :g_cup]
  enum ass_size:        [:flat, :rounded, :bubble_butt, :huge]
  enum lips_size:       [:thin, :plump, :huge]

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
