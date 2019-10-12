require 'rails_helper'

RSpec.describe Player::HandleEnergy do
  let(:player) { create(:player, wallet_amount: 100) }
  subject      { PlayerService.new(player) }

  describe 'Handle and caps players money' do
    it 'update money attributes' do
      expect(subject.handle_money(-50)).to eq true
      expect(player.wallet_amount).to eq 50

      expect(subject.handle_money(50)).to eq true
      expect(player.wallet_amount).to eq 100
    end

    it 'returns false if not enough money' do
      expect(subject.handle_money(-1000)).to eq false
    end
  end

end
