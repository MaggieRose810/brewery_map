Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))

  end if Rails.env.production?
  mount Sidekiq::Web => '/sidekiq'
  root to: 'homes#home'
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :locations, only: [:index]
      resources :beers, only: [:index]
      resources :likes, only: [:create]
    end
  end
  namespace :admin do
    resources :crawls
  end
end