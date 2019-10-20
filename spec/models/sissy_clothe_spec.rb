require 'rails_helper'

RSpec.describe SissyClothe, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:clothe) }
    it { is_expected.to belong_to(:sissy).optional }
  end

end
