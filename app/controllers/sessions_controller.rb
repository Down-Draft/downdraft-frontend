class SessionsController < ApplicationController
  skip_before_action :authorized, only: :omniauth

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    if @user.zip_code.present?
      redirect_to dashboard_index_path
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = 'You have successfully logged off.'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
