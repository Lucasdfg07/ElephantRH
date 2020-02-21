Rails.application.routes.draw do
  get 'patient/index'
  get 'patient/new'
  get 'patient/edit'
  get 'patient/show'
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#index'
end
