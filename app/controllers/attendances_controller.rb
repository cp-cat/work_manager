class AttendancesController < ApplicationController
  before_action :load_head_file
  def index
    # @attendance = Attendance.all
  end
  def new
    @attendance = Attendance.today_data(current_user.id)&.decorate.presence || Attendance.new.decorate
  end

  def create
    input_exec
  end

  def update
    input_exec
  end

  private

  # 登録・更新処理（ajaxでridirectできない）
  def input_exec
    raise ActionController::BadRequest if attendance_param[:start_time].blank? && attendance_param[:end_time].blank?
    params[:attendance]['user_id'] = current_user.id
    @response = Attendance.input_exec(attendance_param)
  rescue ActionController::BadRequest
    @response = request_error_400
  end

  def attendance_param
    params.require(:attendance).permit(:user_id, :work_type_cd, :work_date, :start_time, :end_time, :note)
  end

  def load_head_file
    super
    @load_head_file << 'page/attendances.css'
    @load_head_file << 'page/attendances.js'
  end
end
