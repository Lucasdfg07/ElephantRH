require 'test_helper'

class OfficeVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_visit = office_visits(:one)
  end

  test "should get index" do
    get office_visits_url
    assert_response :success
  end

  test "should get new" do
    get new_office_visit_url
    assert_response :success
  end

  test "should create office_visit" do
    assert_difference('OfficeVisit.count') do
      post office_visits_url, params: { office_visit: { description: @office_visit.description, documents: @office_visit.documents, patient_id: @office_visit.patient_id } }
    end

    assert_redirected_to office_visit_url(OfficeVisit.last)
  end

  test "should show office_visit" do
    get office_visit_url(@office_visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_visit_url(@office_visit)
    assert_response :success
  end

  test "should update office_visit" do
    patch office_visit_url(@office_visit), params: { office_visit: { description: @office_visit.description, documents: @office_visit.documents, patient_id: @office_visit.patient_id } }
    assert_redirected_to office_visit_url(@office_visit)
  end

  test "should destroy office_visit" do
    assert_difference('OfficeVisit.count', -1) do
      delete office_visit_url(@office_visit)
    end

    assert_redirected_to office_visits_url
  end
end
