require 'rails_helper'

RSpec.describe Player::Init do
  let(:user)  { create(:user) }
  subject     { PlayerService.new(nil, user: user) }

  describe 'init' do

    context 'valid params' do
      before do
        @params = { firstname: 'Annabella', lastname: 'Demonia', title: 'Goddess', gender: 'shemale'}
      end

      it 'creates player, house and factory' do
        expect(subject.init(@params)              ).to eq user.players.first
        expect(user.players.first.persisted?      ).to eq true
        expect(user.players.first.firstname       ).to eq 'Annabella'
        expect(user.players.first.house.level     ).to eq 1
        expect(user.players.first.house.upkeep    ).to eq 100
        expect(user.players.first.factory.level   ).to eq 1
        expect(user.players.first.factory.upkeep  ).to eq 100
      end
    end

    context 'invalid params' do
      before do
        @params = { lastname: 'Demonia', title: 'Goddess', gender: 'shemale'}
      end

      it 'return a builded player object' do
        expect(subject.init(@params)              ).to eq user.players.first
        expect(user.players.first.persisted?      ).to eq false
        expect(user.players.first.lastname        ).to eq 'Demonia'
        expect(user.players.first.house           ).to eq nil
        expect(user.players.first.factory         ).to eq nil
      end
    end
  end

end
