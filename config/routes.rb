Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }

  get "modals/test", to: "modals#test"
end
