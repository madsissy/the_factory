require 'rails_helper'

shared_examples_for 'guard player sissy' do

  describe 'Control sissy is owned by player' do
    it 'redirect if sissy is not owned' do
      expect(response).to redirect_to player_factories_path(player)
    end
  end
end
