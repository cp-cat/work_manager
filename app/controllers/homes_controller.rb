class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, except: :error

  def index; end
  def error; end
  def get_user
    @user = current_user
  end
end
