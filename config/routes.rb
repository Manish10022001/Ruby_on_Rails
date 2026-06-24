Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
# get "route" to="controller#methodname"
  get "about", to:"about#index"

  #sign_up route
  get "sign_up", to:"registrations#new"
  #user_path requried in signup
  post "sign_up", to:"registrations#create"

  #for logout 
  delete "logout", to:"session#destroy"

  #for login
  get "sign_in", to:"session#new"
  post "sign_in", to:"session#create"

  # for edit password
  get "password", to:"passwords#edit", as: :edit_password
  patch "password", to:"passwords#update"
  #root route 
  # get "/", to:"main#index" as root route is special route we can directly use
  root to:"main#index"
end
