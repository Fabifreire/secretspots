Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get 'map', to: 'pages#map'
  resources :spots do
    resources :reviews, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spots do
    resources :favorites, only: %i[create] do
      collection do 
        delete :destroy
      end
    end
  end
end
