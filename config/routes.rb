Rails.application.routes.draw do
  


  devise_for :users, controllers: { registrations: 'registrations' }, skip: [:sessions]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    get 'devise/registrations/confirmation_is_sent' 
  end

  resources :users, :articles
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  

  root 'static_pages#landing_page'
  get 'static_pages/about'
  get 'static_pages/contact'

  get 'static_pages/living'
  get 'static_pages/lighting'
  get 'static_pages/dining'
  
  # create home_path and home_url - home_path return /home
  get '/home', to: 'static_pages#landing_page', as: 'home'

  post 'static_pages/thank_you'
  
  post 'payments/create' 
  get  'payments/purchase'  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
