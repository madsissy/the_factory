Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :players,    only: [:index, :new, :create, :destroy] do
    resources :items,    only: [:index],    to: 'players/items#index'

    resource :intro,          only: [:show],     to: 'players/intros#show'
    resource :streets,        only: [:show],     to: 'players/streets#show'
    resource :black_markets,  only: [:show],     to: 'players/black_markets#show'
    resource :houses,         only: [:show],     to: 'players/houses#show' do
      resources :sleeps,      only: [:create],   to: 'players/houses/sleeps#create'
    end
    resource :factories,      only: [:show],     to: 'players/factories#show' do
      resource :dungeons,      only: [:show],     to: 'players/factories/dungeons#show'
    end

    resources :sissies,  only: [:new],   controller: 'players/sissies' do
      resources :recruitments, only: [:new], controller: 'players/sissies/recruitments'
    end
  end

end
