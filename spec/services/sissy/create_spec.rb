require 'rails_helper'

RSpec.describe Sissy::Create do
  let(:player) { create(:player) }
  subject      { SissyService.new(nil, player: player) }

  describe 'create' do
    it 'creates a new sissy with random attributes' do
      result = subject.create

      expect(result               ).to be_kind_of Sissy
      expect(result.persisted?    ).to eq true
      expect(result.firstname.nil?).to eq false
      expect(result.lastname.nil? ).to eq false
      expect(result.birthdate.nil?).to eq false
    end
  end

end
