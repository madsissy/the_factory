require 'rails_helper'

RSpec.describe Player::HandleEnergy do
  let(:player) { create(:player, energy: 10) }
  subject      { PlayerService.new(player) }

  describe 'Handle and caps players energy' do
    it 'update energy attributes' do
      subject.handle_energy(-5)
      expect(player.energy).to eq 5

      subject.handle_energy(5)
      expect(player.energy).to eq 10
    end

    it 'caps player energy' do
      subject.handle_energy(-20)
      expect(player.energy).to eq 0

      subject.handle_energy(100)
      expect(player.energy).to eq 10
    end
  end

end
