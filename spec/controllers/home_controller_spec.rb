require 'rails_helper'

describe HomeController, type: :controller do
  let(:user) {create(:user) }
  subject    { get :index }

  it 'redirects to players index if user signed in' do
    allow( controller ).to receive(:authenticate_user!).and_return true
    allow( controller ).to receive(:current_user).and_return       user

    subject
    expect(response).to redirect_to(players_path(user))
  end

  it 'renders home index if not signed in' do

    subject
    render_template :index
  end
end
