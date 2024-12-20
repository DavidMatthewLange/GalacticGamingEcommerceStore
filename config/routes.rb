Rails.application.routes.draw do
  get "categories/index"
  get "categories/show"
  get "pages/home"
  get "pages/about"
  get "pages/contact"
  root "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "platforms/index"
  get "platforms/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :platforms
  resources :orders, only: %i[index show]
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
end
