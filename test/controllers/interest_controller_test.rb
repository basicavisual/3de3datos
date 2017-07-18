require 'test_helper'

class InterestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interest_index_url
    assert_response :success
  end

  test "should get import" do
    get interest_import_url
    assert_response :success
  end

end
