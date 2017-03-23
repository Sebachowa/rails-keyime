Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'dashboard', to: 'pages#dashboard'
  root to:'pages#home'
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

