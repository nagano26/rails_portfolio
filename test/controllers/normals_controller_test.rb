require "test_helper"

class NormalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get normals_new_url
    assert_response :success
  end

  test "should get show" do
    get normals_show_url
    assert_response :success
  end

  test "should get edit" do
    get normals_edit_url
    assert_response :success
  end
end
