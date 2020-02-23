require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get form_index_url
    assert_response :success
  end

  test "should get edit" do
    get form_edit_url
    assert_response :success
  end

end
