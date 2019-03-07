require "application_system_test_case"

class DonatesTest < ApplicationSystemTestCase
  setup do
    @donate = donates(:one)
  end

  test "visiting the index" do
    visit donates_url
    assert_selector "h1", text: "Donates"
  end

  test "creating a Donate" do
    visit donates_url
    click_on "New Donate"

    fill_in "Act", with: @donate.act_id
    fill_in "Quantity", with: @donate.quantity
    fill_in "User", with: @donate.user_id
    click_on "Create Donate"

    assert_text "Donate was successfully created"
    click_on "Back"
  end

  test "updating a Donate" do
    visit donates_url
    click_on "Edit", match: :first

    fill_in "Act", with: @donate.act_id
    fill_in "Quantity", with: @donate.quantity
    fill_in "User", with: @donate.user_id
    click_on "Update Donate"

    assert_text "Donate was successfully updated"
    click_on "Back"
  end

  test "destroying a Donate" do
    visit donates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Donate was successfully destroyed"
  end
end
