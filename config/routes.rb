Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :responses
      resources :selected_tweets
      resources :tweets
      resources :users
    end
  end

end
