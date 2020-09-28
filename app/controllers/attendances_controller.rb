class AttendancesController < HomesController
  before_action :load_head_file
  def index
    # @attendance = Attendance.all
  end
  def new
    @attendance = Attendance.new
  end
  def create
    params[:attendance]['user_id'] = current_user.id
    raise ActionController::BadRequest if both_time_blank?
    begin
      result = Attendance.create_data(attendance_param)
      render json: { aaa: result[:status], messages: result[:messages] }
    rescue ActionController::BadRequest
      render json: { aaa: result[:status], messages: I18n.t('errors.messages.invalid') }
    end
  end

  private

  def attendance_param
    params.require(:attendance).permit(:user_id, :work_type_cd, :work_date, :start_time, :end_time, :note)
  end

  def both_time_blank?
    attendance_param[:start_time].blank? && attendance_param[:end_time].blank?
  end
  def load_head_file
    super
    @load_head_file << 'page/attendances.css'
    @load_head_file << 'page/attendances.js'
  end
end
