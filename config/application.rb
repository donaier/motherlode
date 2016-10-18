require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Motherlode
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.to_prepare do
      Devise::SessionsController.layout "zhaw_layout"
      Devise::RegistrationsController.layout "zhaw_layout"
    end

    if Rails.env == 'development'
      require 'dotenv'
      Dotenv.load
    end
  end
end
