require 'test_helper'

class FavoriteGsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_gs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_gs_destroy_url
    assert_response :success
  end
end
