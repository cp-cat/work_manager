module AjaxResponse
  extend ActiveSupport::Concern

  def request_error_400
    { status: false, messages: "値#{I18n.t('errors.messages.invalid')}", data: nil }
  end
end
