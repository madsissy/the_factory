require 'rails_helper'

describe Players::Factories::DungeonsController, type: :controller do
  let!(:player)         {create(:player) }
  let!(:player_sissy)  {create(:sissy, player: player)}
  let!(:other_sissy)   {create(:sissy)}

  before do
    allow( controller ).to receive(:authenticate_user!).and_return true
    allow( controller ).to receive(:current_user).and_return       player.user
  end

  describe '#show' do
    subject { get :show, params: { player_id: player.id, sissy_id: player_sissy.id } }

    it_behaves_like 'guard player sissy'

    it "renders show" do
      subject
      expect( response ).to render_template :show
    end
  end
end
