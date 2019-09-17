class Api::V1::UsersController < ApplicationController

  def index
    resp = Faraday.get('https://api.twitter.com/1.1/statuses/user_timeline.json?') do |req|
      req.params['screen_name'] = 'exquisitecop'
      req.headers['Authorization'] = "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
    end

    resp_hash = JSON.parse(resp.body)

    @user = User.new_from_hash(resp_hash[0]['user'])
    @user.build_tweets_from_hash(resp_hash)
    @user.save

    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :avi_url, :bio, :location)
  end

end
