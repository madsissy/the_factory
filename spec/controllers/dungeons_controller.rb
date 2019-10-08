require 'rails_helper'

describe Players::Factories::DungeonsController, type: :controller do
  let(:player) {create(:player) }
  let(:sissy)  {create(:sissy, player: player)}

  subject    { get :show, params: {sissy: sissy} }

   it_behaves_like :guard_player_sissy
end
