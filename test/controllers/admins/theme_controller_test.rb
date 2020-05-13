require 'test_helper'

class Admins::ThemeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_theme_create_url
    assert_response :success
  end

end
