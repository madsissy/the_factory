require 'rails_helper'

RSpec.describe SissyClothe, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:clothe) }
    it { is_expected.to belong_to(:sissy).optional }
  end

  describe 'scopes' do
    let!(:sissy_clothe_outfit)    { create(:sissy_clothe, :outfit) }
    let!(:sissy_clothe_shoes)     { create(:sissy_clothe, :shoes) }
    let!(:sissy_clothe_headgear)  { create(:sissy_clothe, :headgear) }

    it "#outfit" do
      expect(described_class.outfit).to eq [sissy_clothe_outfit]
    end

    it "#shoes" do
      expect(described_class.shoes).to eq [sissy_clothe_shoes]
    end

    it "#headgear" do
      expect(described_class.headgear).to eq [sissy_clothe_headgear]
    end
  end

end
