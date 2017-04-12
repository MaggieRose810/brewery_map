Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :locations, only: [:index]
    end
  end
end
