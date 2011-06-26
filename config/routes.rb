Swchd::Application.routes.draw do
  resources :carrots

  resources :goals

  resources :friendships

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  match '/c/:goal_id/:friend_id' => 'carrots#new'
  match '/learnmore' => 'users#learnmore'
  
  root :to => "users#home"
  resources :users
  resources :sessions
end
