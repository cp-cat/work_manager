class StampsController < HomesController
  before_action :load_head_file
  def index; end

  private

  def load_head_file
    super
    @load_head_file << 'page/stamps.css'
    @load_head_file << 'page/stamps.js'
  end
end
