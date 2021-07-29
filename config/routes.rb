Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :delete]  ## :destroy??
      resources :chores, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
