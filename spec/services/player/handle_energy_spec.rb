require 'rails_helper'

RSpec.describe Player::HandleEnergy do
  let(:player) { create(:player, energy: 10) }
  subject      { PlayerService.new(player) }

  describe 'Handle and caps players energy' do
    it 'update energy attributes' do
      expect(subject.handle_energy(-5)).to eq true
      expect(player.energy).to eq 5

      expect(subject.handle_energy(5)).to eq true
      expect(player.energy).to eq 10
    end

    it 'caps player energy' do
      puts player.enough_energy? 100
      expect(subject.handle_energy(100)).to eq true
      expect(player.energy).to eq 10
    end

    it 'returns false if not enough energy' do
      expect(subject.handle_energy(-12)).to eq false
    end
  end

end
