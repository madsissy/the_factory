require 'rails_helper'

RSpec.describe DayRecap, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:recap_day) }
  end

end
