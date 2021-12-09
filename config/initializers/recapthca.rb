# recaptcha gem settings
# Attention do not confuse the names of variables
Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA_MEGALIBRARY_PUBLIC_KEY']
  config.secret_key = ENV['RECAPTCHA_MEGALIBRARY_PRIVATE_KEY']
end
