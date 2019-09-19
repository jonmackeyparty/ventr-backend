require 'pry'

class Api::V1::TweetsController < ApplicationController

  def show
    @tweet = Tweet.find(params[:id])
    @selected_tweet = SelectedTweet.create_from(@tweet)
    @selected_tweet.save
    render json: @selected_tweet
  end

  private

  def tweet_params
    params.require(:tweet).permit(:id)
  end

end
