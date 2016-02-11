Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

    root                'static_pages#home'     # sets root route to /static_pages/home --> carries out home action in static_pages_controller.rb
    # get               'static_pages/about'    # maps requests for URL /static_pages/about to about action in static_pages_controller.rb
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
    get    'help'    => 'static_pages#help'
    get    'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :microposts,          only: [:create, :destroy]
    resources :relationships,       only: [:create, :destroy]
end