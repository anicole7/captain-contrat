Rails.application.routes.draw do
  get "arena/index"
  root to: "arena#index"

  resources :weapons
  resources :champions
  resources :fights
  resources :turns
end
