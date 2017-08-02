class EventphotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
