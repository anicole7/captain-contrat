Rails.application.routes.draw do
  root to: "arena#index"

  resources :weapons
  resources :champions
  resources :turns
  resources :fights

  resources :arena do
    member do
    end

    collection do
      get 'fight'
    end
  end
end
