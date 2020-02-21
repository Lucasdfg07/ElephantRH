Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root to: 'home#index'

  get 'patient/index'
  get 'patient/new'
  get 'patient/edit'
  get 'patient/show'
end
