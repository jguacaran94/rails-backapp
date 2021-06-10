class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all

    render status: 200
  end

  def show
    respond_with User.find(params[:id])

    render status: 200
  end
end
