class Api::V1::TweetsController < ApplicationController

  before_action :set_user

  def index
    render json: @user.tweets
  end

  def create
    @tweet = @user.tweets.build(tweet_params)
    if @tweet.save
      render json: @tweet
    else
      render json: {error: "Do something right for once!"}
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def tweet_params
    params.require(:tweet).permit(:user_id, :content, :date)
  end

end
