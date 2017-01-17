HelloApp::Application.routes.draw do

  resources :reading_lists
  resources :reading_list_folders
  resources :reviewers, path: 'papers/:paper_id/reviews'
  resources :authors
  resources :people # todo: avoid seeing other people's info

  get   '/signup',  to: 'people#new'
  post  '/signup',  to: 'people#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/reviews/mine' => 'reviewers#mine'

  get    '/people/:id/edit_password' => 'people#edit_password', :as => :edit_password
  post   '/people/:id/edit_password' => 'people#update_password'

  resources :papers do
    get 'pending' => 'papers#index_pending'
  end

  resources :categories

  root 'static_pages#home'
  get '/home',  to: 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get '/feedback', to: 'static_pages#feedback', :as => :feedback # ???


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
