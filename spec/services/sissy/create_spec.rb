require 'rails_helper'

RSpec.describe Sissy::Create do
  let(:player) { create(:player) }
  subject      { SissyService.new(nil, player: player) }

  describe 'create' do
    it 'creates a new sissy with random attributes' do
      result = subject.create

      expect(result                ).to be_kind_of Sissy
      expect(result.persisted?     ).to eq true
      expect(result.birthdate.year ).to be_between((player.current_date - 35.year).year, (player.current_date - 18.year).year)
    end

    context 'from streets location' do
      it 'creates a new sissy with feminine attributes' do
        result = subject.create('streets')

        expect(result                ).to be_kind_of Sissy
        expect(result.persisted?     ).to eq true
        expect(result.will           ).to be_between(50, 100)
        expect(result.feminity       ).to be_between(0, 20)
        expect(result.oral_skill     ).to be_between(0, 10)
        expect(result.anal_skill     ).to be_between(0, 10)
        expect(result.sub_skill      ).to be_between(0, 10)
        expect(result.breasts_size   ).to eq 'no_breasts'
      end
    end
  end

end
