Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }


  # *Modals
  # For the modals, write custom paths following the below pattern
  # get "modals/test", to: "modals#test"
end
