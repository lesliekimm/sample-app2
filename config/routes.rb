Rails.application.routes.draw do
  	root                'static_pages#home'		# sets root route to /static_pages/home --> carries out home action in static_pages_controller.rb
    # get  				'static_pages/about'	# maps requests for URL /static_pages/about to about action in static_pages_controller.rb
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
    get    'help'    => 'static_pages#help'
    get    'signup'  => 'users#new'
    get    'login'   => 'session#new'
    post   'login'	 => 'session#create'
    delete 'logout'  => 'session#destroy'

    resources :users							# creates all actions for REST architecture
end