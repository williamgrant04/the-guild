Rails.application.routes.draw do
  root to: 'events#new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  resources :events, only: %i[new create edit update show]
end
