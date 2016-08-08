ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :releases, :users

  module SignInHelper
    def sign_in_as(user)
      post sign_in_url(email: user.email, password: user.password)
    end
  end

  module RequireAdmin
    def require_admin(user)
      unless user.is_admin
        redirect_to root_path
      end
    end
  end
end