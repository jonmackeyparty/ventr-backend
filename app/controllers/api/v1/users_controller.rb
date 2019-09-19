require 'pry'

class Api::V1::UsersController < ApplicationController

  def show
    resp = Faraday.get('https://api.twitter.com/1.1/statuses/user_timeline.json?') do |req|
      req.params['screen_name'] = params[:username]
      req.params['count'] = 15
      req.params['exclude_replies'] = true
      req.params['include_rts'] = false
      req.params['tweet_mode'] = 'extended'
      req.headers['Authorization'] = "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
    end

    resp_hash = JSON.parse(resp.body)

    @user = User.new_from_hash(resp_hash[0]['user'])
    @user.build_tweets_from_hash(resp_hash)
    @user.save

    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
