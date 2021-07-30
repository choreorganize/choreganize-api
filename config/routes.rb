Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :destroy]
      resources :chores, except: [:new, :edit]
      resources :household, only: [:show]
      get 'household/search', to: 'household#search'
    end
  end
end
