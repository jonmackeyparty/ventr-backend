class Api::V1::SelectedTweetsController < ApplicationController

  def index
    @selected_tweets = SelectedTweet.all
    render json: @selected_tweets
  end

  def create
    @selected_tweet = SelectedTweet.new(tweet_params)
    if @selected_tweet.save
      render json: @selected_tweet
    else
      render json: {error: "Do something right for once!"}
    end
  end

  def show
    @selected_tweet = SelectedTweet.find(params[:id])
    render json: @selected_tweet
  end

  def destroy
    @selected_tweet = SelectedTweet.find(params[:id])
    @selected_tweet.destroy
  end

  private

  def selected_tweet_params
    params.require(:selected_tweet).permit(:user_id, :content, :date)
  end

end
