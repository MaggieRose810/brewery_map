Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'homes#home'
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :locations, only: [:index]
    end
  end
end
