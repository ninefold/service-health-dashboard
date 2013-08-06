ServiceHealthDashboard::Application.routes.draw do
  
  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  if Rails.env == 'production'
    devise_for :users, :controllers => { :registrations => "registrations" } 
  else
    devise_for :users
  end

  get "events/index"

  get "statuses/index"

  root :to => 'Services#index'

  get "services/index"
  
  resources :events, only: [:new, :create, :index, :show, :edit, :update]
  resources :services#, except: :show
  resources :statuses
  match '/expire', to: 'services#expire', as: 'expire'
  match '/1', to: 'services#nf1', as: 'nf1'
  match '/2', to: 'services#nf2', as: 'nf2'
  #match '/admin', to: 'services#admin', as: 'admin'
  #match '/:slug', to: 'services#show', as: 'services_slug_path'


end
