Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :patient

  root to: 'home#index'

  get 'patient/index'

  get 'patient/new'
  post 'patient/create'

  get 'patient/edit'
  get 'patient/show'

  get 'form/index'
  get 'form/new'
  get 'form/edit'
  post 'form/create'
  post 'form/export'
  get 'form/export'
  get 'pdf/generate_pdf'
end
