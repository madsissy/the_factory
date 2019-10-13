class EditSissyForm < Form
  form_attributes :firstname, :lastname, :surname, :job

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
    self.job       = nil
  end

  def save
    return unless valid?
  end
end
