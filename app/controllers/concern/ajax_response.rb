module AjaxResponse
  extend ActiveSupport::Concern

  def request_error_400
    { status: false, messages: I18n.t('errors.messages.invalid'), data: nil }
  end
end
