Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root to: 'home#index'

  resources :patients do
    collection do
      get 'graph'
    end
  end

  resources :forms do
    collection do 
      get 'export'
      post 'export'
    end
  end


  get 'pdf/generate_pdf'
end
