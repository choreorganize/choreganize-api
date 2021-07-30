Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :destroy]
      resources :chores, except: [:new, :edit]
    end
  end
end
