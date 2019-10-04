require 'pry'

class Api::V1::ApologiesController < ApplicationController

  def create
    # binding.pry
    @selected_tweet = SelectedTweet.find(params[:id])
    @selected_tweet.apology = Apology.create_from_selected_tweet
    # binding.pry
    @selected_tweet.save
    render json: @selected_tweet
  end

end
