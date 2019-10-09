require 'pry'

class Api::V1::ResponsesController < ApplicationController

  def create
    @selected_tweet = SelectedTweet.find(params[:id])
    @response = @selected_tweet.responses.build(content: request.body.string, date: Time.now.strftime('%-I:%M %p • %-m/%-d/%Y'))
    @selected_tweet.save
    render json: @selected_tweet
  end

end
