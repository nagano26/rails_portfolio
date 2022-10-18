require "test_helper"

class SubhomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subhome_index_url
    assert_response :success
  end
end
