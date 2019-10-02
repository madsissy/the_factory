require 'rails_helper'

describe HomeController, type: :controller do
  let(:user) {create(:user) }
  subject    { get :index }

  # it 'redirects to players index if user signed in' do
  #   subject
  # end
end
