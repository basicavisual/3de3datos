require 'test_helper'

class FiscalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fiscals_index_url
    assert_response :success
  end

  test "should get import" do
    get fiscals_import_url
    assert_response :success
  end

end
