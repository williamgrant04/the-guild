Rails.application.routes.draw do
  root to: 'home#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  resources :guilds, except: %i[destroy index] do
    resources :games, only: %i[new create]
    resources :events, only: %i[new create index show]
  end

  resources :events, only: %i[edit update destroy]
  resources :games, only: %i[edit update destroy show] do
    resources :game_members, only: %i[new create edit update destroy]
    resources :events, only: %i[new create index show]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :members, only: %i[update]
  resources :event_members, only: %i[create destroy]

  get '/invite/:join_code', to: 'guilds#invite'

  get "modals/:modal", to: "modals#get_modal"
end
