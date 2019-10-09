require 'rails_helper'

shared_examples_for 'guard player sissy' do

  it 'set sissy if associated to player' do
    expect( controller.instance_variable_get(:@sissy) ).to eq player_sissy
  end
end
