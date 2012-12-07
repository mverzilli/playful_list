PlayfulList::Application.routes.draw do

  resources :lists do
    collection { post :sort }
    post 'add_level/:level_id', :action => :add_level
  end

  resources :sessions, :only => [:index] do
    collection do
      post 'start/:list_id', :action => :start, :as => 'start'
    end
    member do
      get  'play/:step/:iteration', :action => :play,      :as => "play"
      post 'play/:step/:iteration', :action => :completed, :as => 'completed'
      post 'too_many_attempts/:step/:iteration', :action => :too_many_attempts, :as => 'too_many_attempts'
      get  'hooray', :action => :finished_level,   :as => 'finished_level'
      get  'finish', :action => :finished_list,    :as => 'finished_list'
    end
    resources :sessions_iters, :as => :iters, :only => [:index]
  end

  devise_for :users

  get '/sign_in_as_demo_user' =>  'home#sign_in_as_demo_user'

  get '/sequence' => 'home#sequence'

  root :to => 'lists#index'

  match ':controller(/:action(/:id))(.:format)'
end
