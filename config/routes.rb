Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root to: 'home#index'

  get 'patient/index'
  get 'patient/new'
  get 'patient/destroy'
  get 'patient/edit'
  get 'patient/show'
  get 'patient/graph'

  post 'patient/create'
  post 'patient/update'
  post 'patient/destroy'


  get 'form/index'
  get 'form/new'
  get 'form/edit'
  get 'form/export'

  post 'form/create'
  get 'form/update'
  post 'form/update'
  post 'form/export'


  get 'pdf/generate_pdf'
end
