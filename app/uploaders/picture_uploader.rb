# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process convert: "png"

  version :thumbnail do
    resize_to_fit(500, 500)
  end
end
