Rails.application.routes.draw do
  resources :messages
  get 'messages/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :real_estate_companies
  post 'real_estate_companies/for_realtor'

  get 'houses/interest_list'

  resources :houses do
    post 'add_potential_buyer'
    post 'delete_potential_buyer'
    member do
      delete 'delete_image_attachment'
    end
  end
  post 'houses/for_realtor'

  devise_for :users, :controllers => {
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'users/new'

  get 'static_pages/contact'
  get 'static_pages/home'
  get 'static_pages/help'
  get  'static_pages/about'
  root 'static_pages#home'

  root 'static_pages#home'
#  get  '/help',    to: 'static_pages#help'
#  get  '/about',   to: 'static_pages#about'
#  get  '/contact', to: 'static_pages#contact'
#  get  '/signup',  to: 'users#new'
end
