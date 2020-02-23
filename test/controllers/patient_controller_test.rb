require 'test_helper'

class PatientControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_index_url
    assert_response :success
  end

  test "should get new" do
    get patient_new_url
    assert_response :success
  end

  test "should get edit" do
    get patient_edit_url
    assert_response :success
  end

  test "should get show" do
    get patient_show_url
    assert_response :success
  end

end
