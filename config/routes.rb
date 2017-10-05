Rails.application.routes.draw do
  resources :articles
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :categories, only: [:index, :show, :create, :edit, :destroy]
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'
  root 'static_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
