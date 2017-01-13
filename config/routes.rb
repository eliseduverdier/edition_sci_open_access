HelloApp::Application.routes.draw do

  resources :reading_lists
  resources :reading_list_folders
  resources :reviewers, path: 'papers/:paper_id/reviews'
  resources :authors
  resources :people
  resources :papers
  resources :categories

  root 'static_pages#home'
  get '/home',  to: 'static_pages#home'
  get '/about', to: 'static_pages#about'

  # get 'papers/:paper_id/reviews'     => 'reviewers#index', :via => [:get]
  # get 'papers/:paper_id/reviews'     => 'reviewers#create', :via => [:post]
  # get 'papers/:paper_id/reviews/new' => 'reviewers#new', :via => [:get]
  # get 'papers/:paper_id/reviews/:id' => 'reviewers#show', :via => [:get]
  # get 'papers/:paper_id/reviews/:id/edit'   => 'reviewers#edit', :via => [:get]
  # get 'papers/:paper_id/reviews/:id/update' => 'reviewers#update', :via => [:patch, :put]
  # get 'papers/:paper_id/reviews/:id' => 'reviewers#update', :via => [:delete]

  # match 'papers/:id/reviews/:review_id' => 'reviewers#new', :via => [:get]

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
