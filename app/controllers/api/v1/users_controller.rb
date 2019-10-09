require 'pry'

class Api::V1::UsersController < ApplicationController
  include UsersHelper

  def create
    get_user_from_twitter(request.body.string)
  end
end
