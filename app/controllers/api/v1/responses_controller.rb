class Api::V1::ResponsesController < ApplicationController

  def index
    @responses = User.all
    render json: @responses
  end

  def create
    @response = User.new(response_params)
    if @response.save
      render json: @response
    else
      render json: {error: "Do something right for once!"}
    end
  end

  def show
    @response = User.find(params[:id])
    render json: @response
  end

  def destroy
    @response = User.find(params[:id])
    @response.destroy
  end

  private

  def response_params
    params.require(:user).permit(:selected_tweet_id, :content, :date)
  end

end
