require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requests_index_url
    assert_response :success
  end

  test "should get new" do
    get requests_new_url
    assert_response :success
  end

  test "should get create" do
    get requests_create_url
    assert_response :success
  end
end
