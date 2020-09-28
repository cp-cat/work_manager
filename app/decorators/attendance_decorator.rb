class AttendanceDecorator < ApplicationDecorator
  delegate_all

  def start_date
    object.start_time.strftime(I18n.t('date.formats.short'))
  end
  def end_date
    object.end_time.strftime(I18n.t('date.formats.short'))
  end
  def start_time
    object.start_time.strftime(I18n.t('time.formats.short2'))
  end
  def end_time
    object.end_time.strftime(I18n.t('time.formats.short2'))
  end
end
