require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get get_links" do
    get pages_get_links_url
    assert_response :success
  end

  test "should get permalink" do
    get pages_permalink_url
    assert_response :success
  end

end
