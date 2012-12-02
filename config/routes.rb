PlayfulList::Application.routes.draw do
  resources :lists

  resources :sessions, :only => [] do
    collection do
      post 'start/:list_id', :action => :start, :as => 'start'
    end
    member do
      get  'play/:step/:iteration', :action => :play,      :as => "play"
      post 'play/:step/:iteration', :action => :completed, :as => 'completed'
      get  'hooray', :action => :finished_level,   :as => 'finished_level'
      get  'finish', :action => :finished_list,    :as => 'finished_list'
    end
  end

  devise_for :users

  get '/sequence' => 'home#sequence'

  root :to => 'lists#index'

  match ':controller(/:action(/:id))(.:format)'
end
