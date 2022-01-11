require "test_helper"

class DeshboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deshboard_index_url
    assert_response :success
  end
end
