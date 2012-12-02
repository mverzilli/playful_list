PlayfulList::Application.routes.draw do

  resources :lists do
    collection { post :sort }
    post 'add_level/:level_id', :action => :add_level
  end

  resources :sessions, :only => [] do
    collection do
      post 'start'
    end
    member do
      get 'play/:step/:iteration', :action => :play, :as => "play"
      post 'success/:step/:iteration', :action => :success, :as => 'success'
      post 'timeout/:step/:iteration', :action => :timeout, :as => 'timeout'
    end
  end

  devise_for :users

  get '/sequence' => 'home#sequence'

  root :to => 'lists#index'

  match ':controller(/:action(/:id))(.:format)'
end
