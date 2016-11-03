CarrierWave.configure do |config|
  if Rails.env.production?
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.root = Rails.root.join('tmp')

    config.fog_credentials = {
      provider:               'AWS',
      aws_access_key_id:      Rails.application.secrets.aws_key,
      aws_secret_access_key:  Rails.application.secrets.aws_secret,
      region:                 'eu-west-1',
    }
    config.fog_directory  = 'hoozzi'
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end
end
