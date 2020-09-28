module WorkTime
  extend ActiveSupport::Concern

  # 24時間以上連続労働してる？
  def over_24hours?(time1, time2)
    datetime2sec(time1 - time2) > 86_400
  end

  # 労働時間計算(23:59:59まで計算可能)
  def calc_work_time(time1, time2)
    time_diff = sec2time(datetime2sec(time2 - time1))
  end

  # 休憩時間計算
  def calc_break_time(time1, time2)
    sec_diff = datetime2sec(time2 - time1)
    hour = sec_diff / 3600
    if hour < 6 #6時間未満
      0
    elsif hour < 8 #6～8時間
      45
    else
      60
    end
  end

  # 基準時間以内か？
  def criteria_time?(datetime)
    # TODO 基準時間をユーザ設定値に追加する
    criteria_start = DateTime.current.start_of_day
    criteria_end = DateTime.current.end_of_day
    datetime >= criteria_start && datetime <= criteria_end
  end

  # datetime(マイクロ秒) -> int(秒)
  def datetime2sec(rational)
    # 絶対値を返す
    (rational * 86_400).to_i.abs
  end

  # int(秒) -> string(時間:分:秒)
  def sec2time(sec)
    Time.at(sec).utc.strftime('%X')
  end

  # 日付を降順（新しい順）にソート(同じ型ならdate,datetime,timeなんでもいい)
  def sort_datetime(sort = 'desc', *times)
    sort == 'desc' ? times.sort { |a, b| a <=> b } : times.sort { |a, b| b <=> a }
  end
end
