Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :facebook,
    ENV.fetch("FACEBOOK_APP_ID"),
    ENV.fetch("FACEBOOK_APP_SECRET"),
    image_size: :large
  )
end
