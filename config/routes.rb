BloodDrive::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :drives, only: [:index, :show] do
    member do
      get :confirmation
    end
  end
  resources :drive_appointments, only: [:create, :update]

  get "/auth/:provider/callback" => "sessions#create"
  get "/signin" => "sessions#new", :as => :signin
  get "/signout" => "sessions#destroy", :as => :signout
  get "/auth/failure" => "sessions#failure"

  root to: "drives#index"
end
