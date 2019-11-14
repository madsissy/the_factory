class EditSissyForm < Form
  form_attributes :firstname, :lastname, :surname, :job_name

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
end
