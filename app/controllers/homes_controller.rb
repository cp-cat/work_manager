class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to login_path unless user_signed_in?
  end
end
