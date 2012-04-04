Utube::Application.routes.draw do
  resources :users

  root :to => 'users#index'
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout
end
