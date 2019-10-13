require 'rails_helper'

RSpec.describe EditSissyForm, type: :form do
  let(:player)  { create(:player) }
  let(:sissy)   { create(:sissy, player: player, firstname: 'Jean', lastname: 'Dos') }
  subject       { described_class.build_from(sissy) }

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
  end

  describe 'save' do
    before do
      @params = { firstname: 'Jeanne', lastname: 'Deaux' }
    end

    context 'Info have changed and has required will' do
      before { sissy.update(will: 0) }

      it 'update sissy info and return result message' do
        subject.assign_attributes(@params)
        expect(subject.save   ).to eq ['Sissy has accepted the changings']
        expect(sissy.firstname).to eq 'Jeanne'
        expect(sissy.lastname ).to eq 'Deaux'
      end
    end
    context 'Info changed and has not required will' do
      before { sissy.update(will: 99) }

      it 'dont update sissy info and return result message' do
        subject.assign_attributes(@params)
        expect(subject.save   ).to eq ['Sissy refused. Her will needs to be broken first.']
        expect(sissy.firstname).to eq 'Jean'
        expect(sissy.lastname ).to eq 'Dos'
      end
    end
  end
end
