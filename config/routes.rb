Swchd::Application.routes.draw do
  resources :goals

  resources :friendships

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "sessions#new"
  resources :users
  resources :sessions
end
