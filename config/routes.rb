Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/search/:username', to: 'users#show'
      get '/tweets/:id', to: 'tweets#show'
      post '/selected_tweets/:id/responses', to: 'responses#create'
    end
  end

end
