class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: {
        success: true
      }
    else
      render json: {
        success: false,
        message: user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password_confirmation)
  end
end
