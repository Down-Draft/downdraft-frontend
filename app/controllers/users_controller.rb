class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:zip_code)
  end
end
