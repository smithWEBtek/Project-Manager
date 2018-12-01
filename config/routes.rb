Rails.application.routes.draw do

  root 'companies#index'
  get 'login', :to => 'sessions#login'
  post 'login', :to => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  get 'signup', :to => 'companies#signup'
  post 'companies/authenticate_signup', :to => 'companies#authenticate_signup'
  get 'logout', :to => 'sessions#destroy'
  get 'reports', :to =>'companies#reports'


  resources :companies, only: [:index, :show] do
    resources :workers, only: [:index, :show, :edit, :create, :new]
  end
  resources :projects, only: [:index, :new, :edit, :update, :create, :destroy, :show]
  resources :workers, only: [:index, :new, :edit, :destroy, :update, :create, :show]
 
end
