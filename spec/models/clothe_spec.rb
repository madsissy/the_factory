require 'rails_helper'

RSpec.describe Clothe, type: :model do

  describe 'enums' do
    it '#kind' do
      clothe = build(:clothe, :outfit)
      expect(clothe.kind ).to eq 'outfit'
      expect(clothe.outfit!).to eq true
      expect(clothe.outfit?).to eq true
      expect(Clothe.kinds).to eq ({"headgear"=>2, "outfit"=>1, "shoes"=>0})
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:modifier) }
  end

end
