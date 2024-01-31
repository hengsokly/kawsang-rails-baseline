Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, class_name: 'Kawsang::User', path: "/",controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "sessions" }

  devise_scope :user do
    match "/verify_otp" => "sessions#verify_otp", via: :post
    match "/verify_otp" => "sessions#show", via: :get
  end

  # Defines the root path route ("/")
  root "users#index"

  resources :users do
    member do
      post :resend_confirmation
      put :archive
      put :restore
    end
  end

  resource :locale, only: [:update]

  resource :about, only: [:show]
  get "/privacy-policy", to: "privacy_policies#show"
  get "/terms-and-conditions", to: "terms_and_conditions#show"

  # # Sidekiq
  # if Rails.env.production?
  #   authenticate :user, ->(user) { user.primary_admin? } do
  #     mount Sidekiq::Web => "/sidekiq"
  #   end
  # else
  #   mount Sidekiq::Web => "/sidekiq"
  # end
end
