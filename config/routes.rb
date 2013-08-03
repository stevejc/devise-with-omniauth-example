Omni::Application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
  resources :authentications
  root to: 'home#index'

end
