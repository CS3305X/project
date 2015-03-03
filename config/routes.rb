Rails.application.routes.draw do

  resources :attendings

  get 'error' => 'static_pages#error'


  resources :registered_fors

  get 'sessions/new'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  
  get    'signup'   => 'users#new'
  post   'signup'   => 'users#create'
  #delete 'logout'  => 'sessions#destroy'
  
  get 'events' => 'events#index'
  
  get 'modules' => 'registered_fors#index'
  get 'addmodules' => 'registered_fors#new'
  post 'addmodules' => 'registered_fors#create'
  

  get 'scheduler' => 'meetings#scheduler'

  get 'admin' => 'admin#dashboard'
  
  get 'tutorial' => 'class_schedules#new'
  
  post 'scheduler' => 'meetings#create'


  resources :user_groups

  resources :meetings

  #resources :class_schedules

  resources :subjects

  resources :personal_events

  resources :users

  resources :usertypes
  
  root 'sessions#new'

  resources :events, except: :show do
    get :delete
  end
  
  resources :class_schedules, except: :show do
    get :delete
  end

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
