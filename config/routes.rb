Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'files/*path', to: 'files#index', as: 'files'
  get 'file/*path', to: 'files#show', as: 'file', constraints: { path: /[0-z\.]+/ }
end
