require 'rails_helper'

RSpec.describe Player::HandleSleep do
  let(:current_date) { Time.new(2031, 6, 21) }
  let(:player)       { create(:player, energy: 5, current_date: current_date) }
  subject            { PlayerService.new(player) }

  describe 'Handle and caps players energy' do
    it 'update energy attributes' do
      subject.handle_sleep
      expect(player.energy).to eq 10
      expect(player.current_date).to eq current_date + 1.day
    end
  end

end
