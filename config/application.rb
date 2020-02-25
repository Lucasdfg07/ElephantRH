require_relative 'boot'

require 'rails/all'
require 'dotenv'
Dotenv.load('keys.env')

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ElephantRH
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.default_locale = "pt-BR"

    config.action_mailer.default_url_options = { host: "localhost:3000" }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 25,
      domain:               'gmail.com',
      user_name:            "#{ENV["EMAIL_KEY"]}",
      password:             "#{ENV["PASSWORD_KEY"]}",
      authentication:       :plain,
      enable_starttls_auto: true
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
