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
  end

end
