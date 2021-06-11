class WelcomeController < ApplicationController
  skip_before_action :authorized

  def index
    redirect_to dashboard_index_path if current_user.present?
  end
end
