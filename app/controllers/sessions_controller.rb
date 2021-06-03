class SessionsController < ApplicationController
  skip_before_action :authorized, only: :omniauth
  
  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to dashboard_index_path
  end

  def destroy
    binding.pry
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end