ServiceHealthDashboard::Application.routes.draw do
  devise_for :users

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
  #match '/:slug', to: 'services#show', as: 'services_slug_path'


end
