require "carrierwave"

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  storage :file

  def store_dir
    "uploads/ckeditor/attachments/#{model.id}"
  end
end
