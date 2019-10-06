Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :players,    only: [:index, :new, :create, :destroy] do
    resource :intro,     only: [:show],     to: 'players/intros#show'
    resource :houses,    only: [:show],     to: 'players/houses#show'
    resource :streets,   only: [:show],     to: 'players/streets#show'
    resource :factories, only: [:show],     to: 'players/factories#show'
    resources :sissies,  only: [:new],   controller: 'players/sissies' do
      resources :recruitments, only: [:new], controller: 'players/sissies/recruitments'
    end
  end

end
