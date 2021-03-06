require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'constants' do
    it { expect(described_class).to have_constant(:TITLES) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:sissies) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:sissy_clothes) }
    it { is_expected.to have_many(:clothes).through(:sissy_clothes) }
    it { is_expected.to have_one(:house) }
    it { is_expected.to have_one(:factory) }
    it { is_expected.to have_one(:day_recap) }
    it { is_expected.to have_one(:weapon).class_name('Item') }
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
    it { is_expected.to validate_numericality_of(:energy      ).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(10) }
    it { is_expected.to validate_numericality_of(:seduction   ).is_less_than_or_equal_to(100) }
    it { is_expected.to validate_numericality_of(:intimidation).is_less_than_or_equal_to(100) }
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

    it '#enough_energy?' do
      player = build(:player, energy: 2)
      expect(player.enough_energy?(3)).to eq false
      expect(player.enough_energy?(2)).to eq true
    end

    it '#enough_fund?' do
      player = build(:player, wallet_amount: 100)
      expect(player.enough_fund?(300)).to eq false
      expect(player.enough_fund?(20)).to eq true
    end
  end
end
