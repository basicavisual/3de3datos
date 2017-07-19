require 'test_helper'

class PatrimonialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patrimonials_index_url
    assert_response :success
  end

  test "should get import" do
    get patrimonials_import_url
    assert_response :success
  end

end
