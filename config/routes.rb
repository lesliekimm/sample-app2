Rails.application.routes.draw do
    root 'static_pages#home'  		# sets root route to /static_pages/home --> carries out home action in static_pages_controller.rb
    get  'static_pages/about'		# maps requests for URL /static_pages/about to about action in static_pages_controller.rb
    get  'static_pages/contact'
    get  'static_pages/help'
end