class Attendance < ApplicationRecord
  include Scope
  extend WorkTime

  validates :user_id, :work_type_cd, :work_date, presence: true
  validates :break_time, length: { maximum: 2 }
  validates :note, length: { maximum: 255 }

  # 勤務時間を登録・更新
  def self.input_exec(params)
    result = { status: false, messages: [], data: nil }
    work_types = WorkType.list
    # 当日分の情報を取得
    if today_data = self.today_data(params[:user_id]).presence
      # 更新
      if params[:start_time].present?
        # 出勤済み
        result[:messages] << I18n.t('errors.messages.already', name: work_types['shukkin'])
      else
        # 退勤する
        today_data.end_time = params[:end_time]
        today_data.break_time = self.calc_break_time(today_data.start_time, today_data.end_time)
        today_data.note = params[:note] #.presence || today_data.note
        result[:status] = today_data.save
        if result[:status]
          result[:messages] << I18n.t('successes.messages.taikin', time: today_data.end_time.strftime(I18n.t('time.formats.short')))
          result[:data] = today_data
        else
          result[:messages] << today_data.errors.messages unless result[:status]
        end
      end
    else
      # 登録
      if params[:start_time].present?
        # 出勤する
        new_data = self.new(params)
        result[:status] = new_data.save
        if result[:status]
          result[:messages] << I18n.t('successes.messages.shukkin', time: new_data.start_time.strftime(I18n.t('time.formats.short')))
          result[:data] = new_data
        else
          result[:messages] << new_data.errors.messages unless result[:status]
        end
      else
        result[:messages] << I18n.t('errors.messages.push', name: work_types['shukkin'])
      end
    end
    return result
  end

  # 最新の勤務日を取得
  def self.latest(user_id)
    self.where(user_id: user_id).order(work_date: :desc).limit(1)
  end
  # 当日の勤務日を取得
  def self.today_data(user_id)
    self.find_by(user_id: user_id, work_date: Date.today)
  end

  # 基準時間を超えた場合は退勤時間に基準時間（終了）を強制的に登録
  def force_update(params)
    # TODO 基準時間をユーザ設定値に追加する
    criteria_start = DateTime.current.start_of_day
    criteria_end = DateTime.current.end_of_day
    datetime >= criteria_start && datetime <= criteria_end
  end
end
