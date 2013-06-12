Yatl::Application.routes.draw do
  scope '/api' do
    devise_for :users, :controllers => {registrations: 'registrations'}
    resources :users
    resources :tasks
    resources :tokens, :only => [:create, :destroy]
  end

  root :to => 'home#index'
end
