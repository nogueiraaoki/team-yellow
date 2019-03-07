require "application_system_test_case"

class GoalRecordsTest < ApplicationSystemTestCase
  setup do
    @goal_record = goal_records(:one)
  end

  test "visiting the index" do
    visit goal_records_url
    assert_selector "h1", text: "Goal Records"
  end

  test "creating a Goal record" do
    visit goal_records_url
    click_on "New Goal Record"

    fill_in "Act", with: @goal_record.act_id
    fill_in "Goal", with: @goal_record.goal_id
    fill_in "Name", with: @goal_record.name
    fill_in "Quantity", with: @goal_record.quantity
    click_on "Create Goal record"

    assert_text "Goal record was successfully created"
    click_on "Back"
  end

  test "updating a Goal record" do
    visit goal_records_url
    click_on "Edit", match: :first

    fill_in "Act", with: @goal_record.act_id
    fill_in "Goal", with: @goal_record.goal_id
    fill_in "Name", with: @goal_record.name
    fill_in "Quantity", with: @goal_record.quantity
    click_on "Update Goal record"

    assert_text "Goal record was successfully updated"
    click_on "Back"
  end

  test "destroying a Goal record" do
    visit goal_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goal record was successfully destroyed"
  end
end
