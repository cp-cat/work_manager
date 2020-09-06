class ApplicationController < ActionController::Base
  # 例外処理
  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from Exception, with: :render_500
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

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
end
