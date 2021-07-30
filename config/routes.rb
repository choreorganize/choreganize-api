Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :destroy]
      resources :chores, only: [:index, :show, :create, :update, :destroy]

      get 'household/search', to: 'household#search'
      resources :household, only: [:show]
    end
  end
end
