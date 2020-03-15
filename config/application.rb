require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)

module DorianMarieFr
  class Application < Rails::Application
    config.load_defaults 6.0

    config.eager_load = false
    config.action_dispatch.cookies_serializer = :json

    config.generators.test_framework = nil

    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE")
  end
end
