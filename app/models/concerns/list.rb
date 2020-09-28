module List
  extend ActiveSupport::Concern

  def list(type = 'hash')
    datas = self.all
    case type
    when 'hash'
      datas.map { |data| [data.cd, data.name] }.to_h
    when 'option_tag'
      datas.map { |data| [data.name, data.cd] }
    end
  end
end
