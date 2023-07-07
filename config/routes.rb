Rails.application.routes.draw do
  get 'elb/health_check' => 'elb#health_check'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :articles, only: [:create, :show, :update, :destroy], param: :slug
  end
end
