Derivaciones::Application.routes.draw do
  resources :exams

  devise_for :users

	#resources :users

  resources :derivacions

  resources :alumnos

  resources :horario_materia

  resources :profesors

  resources :materia

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'profesores' => 'profesors#index'
  match 'materias' => 'materia#index'
  match 'horarios' => 'horario_materia#index'
  match 'derivaciones' => 'derivacions#index'
  match 'sinaprovar' => 'users#index'
  match 'user/edit.:id' => 'users#edit'
  match 'user/approve/:id' => 'users#approve'
  match 'derivaciones/grupales' => 'derivacions#ver_grupales'
  match 'user/switch_year' => 'users#switch_year'

	resource :user
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "materia#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
