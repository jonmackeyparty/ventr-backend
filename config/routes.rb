Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/search/:username', to: 'users#show'
      get '/tweets/:id', to: 'tweets#show'
      resources :users do
        resources :tweets
        resources :selected_tweets
        resources :responses
      end
    end
  end

end
