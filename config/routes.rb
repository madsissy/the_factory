Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :players,    only: [:index, :new, :create, :destroy] do
    resources :items,    only: [:index],    to: 'players/items#index'

    resource :intro,          only: [:show],     to: 'players/intros#show'
    resource :streets,        only: [:show],     to: 'players/streets#show'
    resource :houses,         only: [:show],     to: 'players/houses#show' do
      resources :sleeps,      only: [:create],   to: 'players/houses/sleeps#create'
    end
    resource :black_markets,  only: [:show],           controller: 'players/black_markets' do
      resources :weapons,     only: [:index, :create], controller: 'players/black_markets/weapons'
      # drugs
      # slave market
    end
    resource :factories,      only: [:show],     to: 'players/factories#show' do
      resource :dungeons,     only: [:show],     to: 'players/factories/dungeons#show'
      get :bondage,                              to: 'players/factories/dungeons#bondage'
    end

    resources :sissies,  only: [:new, :edit, :update],   controller: 'players/sissies' do
      resource :sex_relations, only: [], controller: 'players/sissies/sex_relations' do
        get 'oral', to: 'players/sissies/sex_relations#oral'
        get 'anal', to: 'players/sissies/sex_relations#anal'
        get 'bdsm', to: 'players/sissies/sex_relations#bdsm'
      end
      resources :recruitments, only: [:new],  controller: 'players/sissies/recruitments'
    end

    resources :day_recaps, only: [:show, :update], controller: 'players/day_recaps'
  end

end
