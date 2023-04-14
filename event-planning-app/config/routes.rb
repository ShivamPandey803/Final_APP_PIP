Rails.application.routes.draw do
  namespace :api do
    resources :events do
      resources :guests, only: [:index, :create, :update, :destroy]
    end
  end
end
