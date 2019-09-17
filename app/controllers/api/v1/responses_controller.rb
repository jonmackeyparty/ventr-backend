class Api::V1::ResponsesController < ApplicationController

  def index
    @responses = Response.all
    render json: @responses
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      render json: @response
    else
      render json: {error: "Do something right for once!"}
    end
  end

  def show
    @response = Response.find(params[:id])
    render json: @response
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
  end

  private

  def response_params
    params.require(:user).permit(:selected_tweet_id, :content, :date)
  end

end
