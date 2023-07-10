Rails.application.routes.draw do
  get '/healthcheck', to: proc { [200, {}, ['']] }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :articles, only: [:create, :show, :update, :destroy], param: :slug
  end
end
