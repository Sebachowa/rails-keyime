Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'dashboard', to: 'pages#dashboard'
  root to:'pages#home'
  resources :skills do
    resources :bookings
  end
end

