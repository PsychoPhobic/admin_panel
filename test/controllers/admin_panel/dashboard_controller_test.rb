require "test_helper"

module AdminPanel
  class DashboardControllerTest < ActiveSupport::TestCase
    test "root routes to dashboard#index" do
      route = Engine.routes.recognize_path("/", method: :get)

      assert_equal "admin_panel/dashboard", route[:controller]
      assert_equal "index", route[:action]
    end
  end
end
