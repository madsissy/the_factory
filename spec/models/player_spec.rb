require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'constants' do
    it { expect(described_class).to have_constant(:TITLES) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:house) }
    it { is_expected.to have_one(:factory) }
    it { is_expected.to have_many(:sissies) }
  end

  describe 'enums' do
    it '#gender' do
      player = build(:player)

      expect(player.gender).to eq 'male'
      expect(player.male?).to eq true

      player.female!
      expect(player.female?).to eq true

      player.shemale!
      expect(player.shemale?).to eq true
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe 'methods' do
    it '#full_name' do
      player = build(:player, firstname: 'John', lastname: 'Doe')
      expect(player.full_name).to eq "John Doe"
    end

    it '#firstname_with_title' do
      player = build(:player, firstname: 'John', lastname: 'Doe', title: 'Master')
      expect(player.firstname_with_title).to eq "Master John Doe"
    end
  end
end
