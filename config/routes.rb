Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'roommates/search', to: 'roommates#search'
      resources :roommates, except: [:new, :edit, :destroy]
      resources :chores, except: [:new, :edit]
      get 'household/search', to: 'household#search'
      resources :household, only: [:show, :create]
      resources :assignments, only: [:create, :update]
    end
  end
end
