# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: "png"
  process tags: "user_avatar"
  
  version :standard do
    process resize_to_fill: [100, 150, :north]
  end
  
  version :thumbnail do
    resize_to_fit(200, 200)
  end

  def default_url *args
    "http://res.cloudinary.com/duyhung/image/upload/c_scale,w_200/v1470659816/default_avatar.png"
  end

end
