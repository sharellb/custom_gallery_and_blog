CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'aws_access_key_id',
      :aws_secret_access_key => 'aws_secret_access_key',
      :region => 'S3_REGION'
    }
 
  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
 
  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads" 
  config.fog_directory = 'S3_BUCKET_NAME'
end 
 