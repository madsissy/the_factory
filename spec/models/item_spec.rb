require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
  end

  describe 'enums' do
    it '#kind' do
      item = build(:item)
      expect(item.kind ).to eq 'weapon'
      expect(item.drug!).to eq true
      expect(item.drug?).to eq true
      expect(Item.kinds).to eq ({"drug"=>1, "weapon"=>0})
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:modifier) }
    it { is_expected.to validate_presence_of(:modified_attribute) }
  end

end
