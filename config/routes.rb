Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :places, only:[:index, :show]
  resources :breweries do
    post 'toggle_activity', on: :member
  end

  root 'breweries#index'
  get 'signup', to: 'users#new', as: "signup"
  get 'beers', to: 'beers#index'
  get 'signin', to: 'sessions#new', as: "login"
  get 'memberships', to: 'memberships#new'
  post 'memberships', to: 'memberships#create'
  get 'beer_clubs', to: 'beer_clubs#index'
  post 'ratings', to: 'ratings#create'
  get 'places', to: 'places#index'
  delete 'signout', to: 'sessions#destroy', as: "logout"
  post 'places', to:'places#search'
  post 'places', to:'places#search'
  post 'users/:id/freeze', to: 'users#freeze_account', as: "freeze"
  get 'beerlist', to:'beers#list'
  get 'brewerylist', to:'breweries#list'
  get 'auth/:provider/callback', to: 'sessions#create_oauth', as: "auth"



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
