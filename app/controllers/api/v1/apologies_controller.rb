require 'pry'

class Api::V1::ApologiesController < ApplicationController

  def create
    @selected_tweet = SelectedTweet.find(params[:id])
    @selected_tweet.apology = Apology.create_from_selected_tweet
    @selected_tweet.save
    render json: @selected_tweet
  end

end
