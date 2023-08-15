require "application_system_test_case"

class CrmsTest < ApplicationSystemTestCase
  setup do
    @crm = crms(:one)
  end

  test "visiting the index" do
    visit crms_url
    assert_selector "h1", text: "Crms"
  end

  test "should create crm" do
    visit crms_url
    click_on "New crm"

    fill_in "App email", with: @crm.app_email
    fill_in "App name", with: @crm.app_name
    fill_in "App phone", with: @crm.app_phone
    click_on "Create Crm"

    assert_text "Crm was successfully created"
    click_on "Back"
  end

  test "should update Crm" do
    visit crm_url(@crm)
    click_on "Edit", match: :first

    fill_in "App email", with: @crm.app_email
    fill_in "App name", with: @crm.app_name
    fill_in "App phone", with: @crm.app_phone
    click_on "Update"

    assert_text "Crm was successfully updated"
    click_on "Back"
  end

  test "should destroy Crm" do
    visit crm_url(@crm)
    click_on "Destroy this crm", match: :first

    assert_text "Crm was successfully destroyed"
  end
end
