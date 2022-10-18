require "test_helper"

class LifestylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lifestyles_index_url
    assert_response :success
  end

  test "should get show" do
    get lifestyles_show_url
    assert_response :success
  end

  test "should get new" do
    get lifestyles_new_url
    assert_response :success
  end

  test "should get edit" do
    get lifestyles_edit_url
    assert_response :success
  end
end
