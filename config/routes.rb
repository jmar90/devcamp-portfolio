Rails.application.routes.draw do
	# about, & contact are static pages (hence why they use just 'get' vs. 'resources')
	# Customize show route for portolios (want it to be /portfolio vs. /portfolios). Also assign it custom prefix portfolio_show
  resources :portfolios, except: [:show]
  get 'portfolio/:id/', to: 'portfolios#show', as: 'portfolio_show'

  # Change route from pages/about to just about. Point about route to about action in pages controller.
  # controller goes on left of #; action on right
  # Note: You can pass in anything as route name (eg, 'about-me' instead of 'about')
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Create toggle_status route
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # Set root path (home page) to pages#home (pages controller, home action)
  root to: 'pages#home'
end
