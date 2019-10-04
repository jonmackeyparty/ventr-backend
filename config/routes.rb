Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/tweets/:id', to: 'tweets#show'
      post '/selected_tweets/:id/responses', to: 'responses#create'
      get '/selected_tweets/:id/apology', to: 'apologies#create'
    end
  end

end
