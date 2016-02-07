Rails.application.routes.draw do
  get 'users/new'

    root             'static_pages#home'  		# sets root route to /static_pages/home --> carries out home action in static_pages_controller.rb
    # get  'static_pages/about'					# maps requests for URL /static_pages/about to about action in static_pages_controller.rb
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
    get 'help'    => 'static_pages#help'
end