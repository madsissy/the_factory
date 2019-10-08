require 'rails_helper'

shared_examples_for 'guard_player_sissy' do
  let(:sissy) { create(:sissy) }

  it 'set sissy if associated to player' do
    subject
    expect( @sissy ).to eq sissy
  end
end
