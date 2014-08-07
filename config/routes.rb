Jaunt::Application.routes.draw do
  
  get 'businesses/save', to: 'businesses#save' 
  resources :businesses

  get 'trips/itinerary', to: 'trips#itinerary'
  get 'trips/saved_trips', to: 'trips#saved_trips'
  post 'trips/place_details', to: 'trips#place_details'
  post 'trips/trip_details', to: 'trips#trip_details'
  post 'trips/delete', to: 'trips#delete' 
  get 'yelp/search', to: 'yelp#search'
  get 'yelp/result', to: 'yelp#result'
  get 'yelp/error', to: 'yelp#error' 
  post 'yelp/set_cookie', to: 'yelp#set_cookie'
  post 'trips/save', to: 'trips#save'
  get 'display/image', to: 'businesses#display_image'
  get 'display/rating', to: 'businesses#display_rating'
  get 'foo', to: 'businesses#image' 
  root 'welcome#index'
  
  get 'login', to: 'welcome#login' 
  
  # Routes for authentication
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
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
