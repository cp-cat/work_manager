class ApplicationController < ActionController::Base
  include AjaxResponse
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # 例外処理
  class DuplicateError < StandardError; end

  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from StandardError, with: :render_500
    rescue_from Exception, with: :render_500
  end

  # 404エラー
  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end
  # 500エラー
  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[email login_id password name]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:login, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  # ログイン後リダイレクト先
  def after_sign_in_path_for(resource)
    root_path
  end
  # ログアウト後リダイレクト先
  def after_sign_out_path_for(resource)
    login_path
  end
  # headタグ内ファイル読み込み
  def load_head_file
    @load_head_file, @file_load_error_message = [], []
  end
end
