Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, skip: [:registrations],
                       path_names: {
                         sign_in: "login",
                         sign_out: "logout",
                         registration: "signup"
                       },
                       controllers: {
                         sessions: "users/sessions",
                         registrations: "users/registrations",
                         passwords: "users/passwords_reset"
                       }

    devise_scope :user do
      post "users", to: "users/registrations#create"
      put "users", to: "users/registrations#update"
    end

    resources :categories
    resources :gym_classes
  end
end
