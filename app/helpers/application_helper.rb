module ApplicationHelper
  # アセットファイル存在チェック
  def asset_exists?(subdirectory, filename)
    File.exists?(Rails.root.join('app', 'assets', subdirectory, filename))
  end
  # 画像ファイル存在チェック
  def image_exists?(image)
    asset_exists?('images', image)
  end
  # 曜日名取得
  def wday(now: Date.today)
    return I18n.t('date.abbr_day_names')[now.wday]
  end
  # 今日の日付を取得
  def current_date(format = 'long2')
    Date.today.strftime(t "date.formats.#{format}", wday: wday)
  end
end
