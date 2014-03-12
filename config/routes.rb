BloodDrive::Application.routes.draw do
  resources :drive_locations, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :drives, only: [:index] do
    member do
      get :confirmation
      get :notice
    end
    resources :drive_appointments, path: "appointments", only: [:new, :create]
  end
  resources :drive_appointments, path: "appointments", only: [:index]

  get "/auth/:provider/callback" => "sessions#create"
  get "/signin" => "sessions#new", :as => :signin
  get "/signout" => "sessions#destroy", :as => :signout
  get "/auth/failure" => "sessions#failure"

  root to: "drives#index"
end
