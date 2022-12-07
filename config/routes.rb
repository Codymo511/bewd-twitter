Rails.application.routes.draw do
  root 'homepage#index'
  get '/feeds' => 'feeds#index'

  # USERS
    post '/users' =>'users#create'
  # SESSIONS
   post '/sessions' => 'sessions#create'
   get '/authenticated' => 'sessions#authenticated'
   delete 'sessions/'=> 'sessions#destroy'
  # TWEETS
   post '/tweets' => 'tweets#create'
   delete '/tweets' => 'tweets#destroy'
   get '/tweets' => 'tweets#authenticated'
   get 'tweets' => 'tweets#index_by_user'
  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
