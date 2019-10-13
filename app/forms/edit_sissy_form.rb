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
    self.job_name  = nil
  end

  def save
    result_notice = []
    return unless valid?

    unless sissy_info_changed? && @sissy.will >= 50
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
      create_or_update_job job_name
      result_notice << "Sissy will work has a #{job_name}."
    end

    return result_notice
  end

  private

  def sissy_info_changed?
    (self.firstname != @sissy.firstname) || (self.lastname != @sissy.lastname) || (self.surname != @sissy.surname.to_s)
  end

  def create_or_update_job job_name
    job = Job.find_by(name: job_name)
    @sissy.sissy_jobs.update_all(current_job: false)

    if @sissy.jobs.where(name: job_name).empty?
      @sissy.sissy_jobs.create(job: job, experience: 0, current_job: true)
    else
      @sissy.sissy_jobs.find_by(job_id: job.id).update(current_job: true)
    end
  end
end
