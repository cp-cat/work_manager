class AttendanceDecorator < ApplicationDecorator
  delegate_all

  def start_date
    object.start_time&.strftime(I18n.t('date.formats.short'))
  end
  def end_date
    object.end_time&.strftime(I18n.t('date.formats.short'))
  end
  def start_time
    object.start_time&.strftime(I18n.t('time.formats.short2'))
  end
  def end_time
    object.end_time&.strftime(I18n.t('time.formats.short2'))
  end
  # 出勤ボタン
  def shukkin_btn
    if object.start_time.present?
      h.content_tag :button, type: 'submit', class: 'btn btn-primary', id: 'shukkin' do
        "#{h.icon('fas', 'check-circle')} #{h.tag.span(self.start_time)}".html_safe
      end
    else
      h.content_tag :button, type: 'submit', class: 'btn btn-primary', id: 'shukkin' do
        '出勤'
      end
    end
  end
  # 退勤ボタン
  def taikin_btn
    if object.end_time.present?
      h.content_tag :button, type: 'submit', class: 'btn btn-danger', id: 'taikin' do
        "#{h.icon('fas', 'check-circle')} #{h.tag.span(self.end_time)}".html_safe
      end
    else
      h.content_tag :button, type: 'submit', class: 'btn btn-danger', id: 'taikin' do
        '退勤'
      end
    end
  end
end
