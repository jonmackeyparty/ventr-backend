class Api::V1::TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      render json: @tweet
    else
      render json: {error: "Do something right for once!"}
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content, :date)
  end

end
