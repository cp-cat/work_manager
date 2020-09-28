class HomesController < ApplicationController
  # include AjaxResponse
  before_action :authenticate_user!
  before_action :get_user, except: :error

  def index; end
  def error; end
  def get_user
    @user = current_user
  end
  def load_head_file
    @load_head_file, @file_load_error_message = [], []
  end
end
