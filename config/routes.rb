Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  resources :guilds, except: %i[destroy index] do
    resources :games, only: %i[new create]
  end

  resources :games, only: %i[show] do
    resources :game_members, only: %i[new create]
  end

  resources :events, only: %i[new create edit update show]
  # *Modals
  # For the modals, write custom paths following the below pattern
  # get "modals/test", to: "modals#test"
end
