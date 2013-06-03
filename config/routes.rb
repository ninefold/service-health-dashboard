ServiceHealthDashboard::Application.routes.draw do
  get "events/index"

  get "statuses/index"

  root :to => 'Services#index'

  get "services/index"
  
  resources :events
  resources :services, except: :show
  resources :statuses
  match '/1', to: 'Services#nf1', as: 'nf1_path'
  match '/2', to: 'Services#nf2', as: 'nf2_path'
  match ':slug', to: 'Services#show', as: 'services_slug_path'

end
