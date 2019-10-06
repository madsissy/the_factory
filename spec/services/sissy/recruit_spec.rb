require 'rails_helper'

RSpec.describe Sissy::Recruit do
  let(:sissy)  { create(:sissy, will: 50) }
  subject      { SissyService.new(sissy, player: sissy.player) }

  describe 'Return result for the recruitment of a sissy' do
    context 'player seduction is greater or equal to sissy\'s will' do
      before{ sissy.player.update(seduction: 50) }

      it 'returns true and sets owned' do
        expect(subject.recruit).to eq true
        expect(sissy.owned    ).to eq true
      end
    end

    context 'player intimidation is greater or equal to sissy\'s will' do
      before{ sissy.player.update(seduction: 60) }

      it 'returns true and sets owned' do
        expect(subject.recruit).to eq true
        expect(sissy.owned    ).to eq true
      end
    end

    context 'player intimidation and seduction are lower than sissy\'s will' do
      before{ sissy.player.update(seduction: 49, intimidation: 30) }

      it 'returns true' do
        expect(subject.recruit).to eq false
      end
    end
  end

end
