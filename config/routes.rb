Rails.application.routes.draw do
  devise_for :users
  namespace 'api', defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    namespace 'v1' do
      resources :users, :only => [:index, :show, :create, :update, :destroy] do
        resources :products, :only => [:create]
      end
      resources :products, :only => [:index, :show]
    end
  end
end
