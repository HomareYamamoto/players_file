require "test_helper"

class Admin::NationalitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_nationalities_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_nationalities_edit_url
    assert_response :success
  end
end
