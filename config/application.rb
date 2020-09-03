require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)

module NeverEatAlone
  class Application < Rails::Application
    config.load_defaults 6.0

    config.eager_load = false
    config.action_dispatch.cookies_serializer = :json

    config.generators.test_framework = nil

    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE")

    config.i18n.available_locales = [:fr]
    config.i18n.default_locale = :fr

    config.time_zone = "Europe/Paris"
  end
end
