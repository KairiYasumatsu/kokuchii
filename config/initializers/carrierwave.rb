CarrierWave.configure do |config|

  config.fog_provider = 'fog/aws' # required
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["AWS_KEY"],
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],#開発環境においては使わない設定となっているので、今は必要ないです
    region: 'us-east-1',
    host:                  's3.amazonaws.com/geekphoto',             # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'geekphoto'                # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
