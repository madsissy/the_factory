class Sissy < ApplicationRecord
  # TODO: add health / food & water consumption

  # === Constants ===
  WILL_THRESHOLD        = 50
  SUB_SKILL_THRESHOLD   = 60

  #  === Relations ===
  belongs_to :player
  has_many   :sissy_jobs
  has_many   :jobs, through: :sissy_jobs
  has_one    :current_job, -> { where(current_job: true) }, class_name: 'SissyJob'

  # === Scopes ===
  scope :prostitutes, -> { joins(sissy_jobs: :job).where(sissy_jobs: { current_job: true }, jobs: { name: 'Prostitute' } ) }

  # === Enum ===
  enum hair_color:      [:blond_hair, :platinum_blond_hair, :brown_hair, :dark_brown_hair, :jet_black_hair, :ginger_hair, :red_hair, :pink_hair, :green_hair, :blue_hair]
  enum eyes_color:      [:brown_eyes, :black_eyes, :green_eyes, :blue_eyes, :grey_eyes]
  enum skin_color:      [:pale_skin, :olive_skin, :tanned_skin, :black_skin]
  enum testicles_size:  [:micro_testicles, :small_testicles, :big_testicles, :huge_testicles]
  enum breasts_size:    [:no_breasts, :a_cup, :b_cup, :c_cup, :d_cup, :e_cup, :g_cup]
  enum ass_size:        [:flat_ass, :rounded_ass, :bubble_butt_ass, :huge_ass]
  enum lips_size:       [:thin_lips, :plump_lips, :huge_lips]
  enum location:        [:in_house, :in_factory]

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
  validates_presence_of :attractiveness
  validates_presence_of :feminity
  validates_presence_of :will
  validates_presence_of :oral_skill
  validates_presence_of :anal_skill
  validates_presence_of :sub_skill

  validates_numericality_of :height,          greater_than: 149,            less_than: 191
  validates_numericality_of :weight,          greater_than: 49,             less_than: 121
  validates_numericality_of :penis_size,      greater_than: 0,              less_than: 31
  validates_numericality_of :hair_length,     greater_than_or_equal_to: 0,  less_than: 121
  validates_numericality_of :attractiveness,  greater_than_or_equal_to: 0,  less_than: 101
  validates_numericality_of :feminity,        greater_than_or_equal_to: 0,  less_than: 101
  validates_numericality_of :will,            greater_than_or_equal_to: 0,  less_than: 101
  validates_numericality_of :oral_skill,      greater_than_or_equal_to: 0,  less_than: 101
  validates_numericality_of :anal_skill,      greater_than_or_equal_to: 0,  less_than: 101
  validates_numericality_of :sub_skill,       greater_than_or_equal_to: 0,  less_than: 101

  #  === Methods ===
  def full_name
    surname.present? ? "#{firstname} '#{surname}' #{lastname}" : "#{firstname} #{lastname}"
  end

  def age_from_birthdate
    age = player.current_date.year - birthdate.year
    age -= 1 if player.current_date < birthdate + age.years
    age
  end

end
