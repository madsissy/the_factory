require 'rails_helper'

RSpec.describe Sissy, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
  end

  describe 'methods' do
    it '#full_name' do
      sissy = build(:sissy, firstname: 'Sissy', lastname: 'Lou')
      expect(sissy.full_name).to eq "Sissy Lou"
    end
  end

end
