Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'

  resource :user_session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :time_entries, only: [:create, :edit, :new, :update, :index, :show]
  end
  resources :categories, only: [:new, :index, :create, :destroy, :edit, :update]
  resources :clients, only: [:new, :create, :index, :destroy, :edit, :update]
  get '/reports/', to: 'reports#show', as: 'report'
  resources :password_resets
  get '/employees/', to: 'reports#employees', as: 'employees'
  get 'employees/:id/report', to: 'reports#employee_report', as: 'employee_report'


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
