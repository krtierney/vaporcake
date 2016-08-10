require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Vaporcake
  class Application < Rails::Application
    config.generators do |g|
      g.assets            false
      g.helper            false
      g.test_framework    nil
      g.jbuilder          false
    end
    config.exceptions_app = self.routes
  end
end


