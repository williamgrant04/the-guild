Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  root to: 'guilds#show'
  resources :guilds, except: %i[destroy]
end
