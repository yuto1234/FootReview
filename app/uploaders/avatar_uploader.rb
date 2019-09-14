class AvatarUploader < CarrierWave::Uploader::Base
  # 本番環境ではS3に画像を保存
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 200*200サイズで保存
  include CarrierWave::MiniMagick
  process resize_to_fit: [200, 200]

  def default_url
    "default.jpg"
  end
end
