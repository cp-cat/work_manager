Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }
  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'sign_up', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end
  root 'homes#index'
  resources :homes, :stamps
end
