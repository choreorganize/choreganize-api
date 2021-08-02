Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :destroy]
      resources :chores, except: [:new, :edit]
      get 'household/search', to: 'household#search'
      resources :household, only: [:show, :create]
    end
  end
end
