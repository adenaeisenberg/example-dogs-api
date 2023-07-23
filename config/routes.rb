Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  post "/dogs" => "dogs#create"
  get "/dogs" => "dogs#index"
end
