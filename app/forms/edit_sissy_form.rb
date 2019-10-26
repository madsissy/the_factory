class EditSissyForm < Form
  form_attributes :firstname, :lastname, :surname, :job_name,
                  :headgear, :outfit, :shoes

  validates_presence_of :firstname
  validates_presence_of :lastname

  def self.build_from sissy
    new sissy
  end

  def initialize sissy
    @sissy = sissy

    self.firstname = @sissy.firstname
    self.lastname  = @sissy.lastname
    self.surname   = @sissy.surname
    self.job_name  = @sissy.current_job&.job&.name
    self.headgear  = @sissy.headgear
    self.outfit    = @sissy.outfit
    self.shoes     = @sissy.shoes
  end

  def save
    result_notice = []
    return unless valid?

    unless sissy_info_changed? && @sissy.will >= Sissy::WILL_THRESHOLD
      @sissy.update(
        firstname: self.firstname,
        lastname:  self.lastname,
        surname:   self.surname,
      )
      result_notice << 'Sissy has accepted the changings'
    else
      result_notice << 'Sissy refused. Her will needs to be broken first.'
    end

    maybe_assign_sissy_clothe(self.headgear)  if self.headgear.present?
    maybe_assign_sissy_clothe(self.outfit)    if self.outfit.present?
    maybe_assign_sissy_clothe(self.shoes)     if self.shoes.present?

    if job_name.present?
      if create_or_update_job(job_name)
        result_notice << "Sissy will work has a #{job_name}."
      else
        result_notice << "Sissy won't work has a #{job_name}. Need more training !"
      end
    end

    return result_notice
  end

  private

  def sissy_info_changed?
    (self.firstname != @sissy.firstname) || (self.lastname != @sissy.lastname) || (self.surname != @sissy.surname.to_s)
  end

  def create_or_update_job job_name
    SissyService.new(@sissy).create_or_update_job(job_name)
  end

  def maybe_assign_sissy_clothe sissy_clothe_id
    sissy_clothe = SissyClothe.find(sissy_clothe_id)
    if (sissy_clothe.clothe.will_needed >= @sissy.will) && (sissy_clothe.clothe.feminity_needed <= @sissy.feminity) && (sissy_clothe.clothe.sub_skill_needed <= @sissy.sub_skill)
      sissy_clothe.update(sissy: @sissy)
    end
  end
end
