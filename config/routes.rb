Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roommates, except: [:new, :edit, :delete]
    end
  end
end
