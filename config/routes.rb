Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'},
                     controllers: { confirmations: 'confirmations' }

  resources :users
  resources :articles, :products
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :categories, only: [:index, :show, :create, :edit, :destroy]

  root 'static_pages#landing_page'
  get 'static_pages/about'
  get 'static_pages/contact'

  get 'static_pages/living'
  get 'static_pages/lighting'
  get 'static_pages/dining'
  
  # create home_path and home_url - home_path return /home
  get '/home', to: 'static_pages#landing_page', as: 'home'

  post 'static_pages/thank_you'

    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
