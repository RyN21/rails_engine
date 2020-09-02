Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      ## search
      get '/merchants/find', to: 'search_merchants#show'
      get '/merchants/find_all', to: 'search_merchants#index'

      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show, :create, :update, :destroy]

      ## relationships
      get '/merchants/:merchant_id/items', to: 'items#index'
      get '/items/:item_id/merchant', to: 'merchants#show'

    end
  end
end
