require 'test_helper'

class InterestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interests_index_url
    assert_response :success
  end

  test "should get import" do
    get interests_import_url
    assert_response :success
  end

end
