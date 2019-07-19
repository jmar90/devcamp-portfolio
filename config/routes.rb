Rails.application.routes.draw do
	# about, & contact are static pages (hence why they use just 'get' vs. 'resources')
  resources :portfolios

  # Chagne route from pages/about to just about. Point about route to about action in pages controller.
  # controller goes on left of #; action on right
  # Note: You can pass in anything as route name (eg, 'about-me' instead of 'about')
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  # Set root path (home page) to pages#home (pages controller, home action)
  root to: 'pages#home'
end
