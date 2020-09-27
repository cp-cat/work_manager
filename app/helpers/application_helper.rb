module ApplicationHelper
  def asset_exists?(subdirectory, filename)
    File.exists?(Rails.root.join('app', 'assets', subdirectory, filename))
  end

  def image_exists?(image)
    asset_exists?('images', image)
  end
end
