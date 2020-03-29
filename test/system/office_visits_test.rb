require "application_system_test_case"

class OfficeVisitsTest < ApplicationSystemTestCase
  setup do
    @office_visit = office_visits(:one)
  end

  test "visiting the index" do
    visit office_visits_url
    assert_selector "h1", text: "Office Visits"
  end

  test "creating a Office visit" do
    visit office_visits_url
    click_on "New Office Visit"

    fill_in "Description", with: @office_visit.description
    fill_in "Documents", with: @office_visit.documents
    fill_in "Patient", with: @office_visit.patient_id
    click_on "Create Office visit"

    assert_text "Office visit was successfully created"
    click_on "Back"
  end

  test "updating a Office visit" do
    visit office_visits_url
    click_on "Edit", match: :first

    fill_in "Description", with: @office_visit.description
    fill_in "Documents", with: @office_visit.documents
    fill_in "Patient", with: @office_visit.patient_id
    click_on "Update Office visit"

    assert_text "Office visit was successfully updated"
    click_on "Back"
  end

  test "destroying a Office visit" do
    visit office_visits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office visit was successfully destroyed"
  end
end
