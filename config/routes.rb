Rails.application.routes.draw do
  root to: 'events#new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  resources :events, only: %i[new create edit update show]
  resources :guilds, except: %i[destroy index]
  # *Modals
  # For the modals, write custom paths following the below pattern
  # get "modals/test", to: "modals#test"
end
