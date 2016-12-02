Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cities#index'

  resources :cities, only: [:index] do 
    get :subway
  end
end
