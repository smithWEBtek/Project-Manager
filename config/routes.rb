Rails.application.routes.draw do

  root 'companies#account'
  get 'companies/account', :to => 'companies#account'
  get 'companies/login', :to => 'companies#login'
  get 'companies/signup', :to => 'companies#signup'
  get 'companies/logout', :to => 'companies#logout'
  post 'companies/authenticate_login', :to => 'companies#authenticate_login'
  post 'companies/authenticate_signup', :to => 'companies#authenticate_signup'

  resources :companies, only: [:index, :new, :edit, :account, :signup, :update, :show] do
    resources :workers, only: [:index, :show, :edit, :create, :new]
  end
  resources :projects, only: [:index, :new, :edit, :update, :create, :most_popular, :destroy, :show]
  resources :workers, only: [:index, :new, :edit, :destroy, :update, :create, :show]
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
