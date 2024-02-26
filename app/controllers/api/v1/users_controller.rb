class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner
  
  def show
    json_response( @user )
  end

  def update
    if @user.update(user_params)
      json_response( @user )
    else
      render json_response( @user.errors, status: :unprocessable_entry )
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password)
  end

  def check_owner
    head :forbidden unless @user.id == current_user&.id
  end
end
