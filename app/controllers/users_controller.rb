class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to dashboard_index_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:zip_code)
  end
end
