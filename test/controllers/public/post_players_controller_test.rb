require "test_helper"

class Public::PostPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_players_new_url
    assert_response :success
  end

  test "should get index" do
    get public_post_players_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_players_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_post_players_edit_url
    assert_response :success
  end
end
