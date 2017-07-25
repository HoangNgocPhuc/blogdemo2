class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end

  process :extract_dimensions

  version :thumb do
    process resize_to_fill:
      [Settings.picture.fill_width, Settings.picture.fill_height]
  end

  version :content do
    process resize_to_limit:
      [Settings.picture.limit_width, Settings.picture.limit_height]
  end
end
