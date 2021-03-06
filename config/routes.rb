Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get 'map', to: 'pages#map'
  resources :reports, only: %i[update]
  resources :spots do
    resources :reviews, only: %i[new create] do
      resources :likes, only: %i[create] do
        collection do
          delete :destroy
        end
      end
    end
  end
  resources :reviews, only: %i[destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spots do
    resources :favorites, only: %i[create] do
      collection do
        delete :destroy
      end
    end
  end
  resources :spots, :reviews do
    resources :reports, only: %i[new create]
  end
  resources :reports, only: %i[destroy]
  get "outlaws/:id", to: "outlaws#banned", as: :outlaw
end
