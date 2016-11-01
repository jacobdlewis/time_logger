Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #devise/sessions
  root 'home#index'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  resources :password_resets
  resource :user_session, only: [:new, :create, :destroy]

  #resources
  resources :activities, except: [:destroy]
  resources :categories, only: [:new, :index, :create, :destroy, :edit, :update]
  resources :clients
  resources :projects do
    get :close
    get :reopen
  end
  resources :users, only: [:new, :create] do
    resources :time_entries, only: [:create, :edit, :new, :update, :index, :show]
  end
  namespace :reports do
    get :projects
    get :detail_report
    get :mileage
  end

end
