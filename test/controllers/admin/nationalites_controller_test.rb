require "test_helper"

class Admin::NationalitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_nationalites_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_nationalites_edit_url
    assert_response :success
  end
end
