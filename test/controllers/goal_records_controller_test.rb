require 'test_helper'

class GoalRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal_record = goal_records(:one)
  end

  test "should get index" do
    get goal_records_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_record_url
    assert_response :success
  end

  test "should create goal_record" do
    assert_difference('GoalRecord.count') do
      post goal_records_url, params: { goal_record: { act_id: @goal_record.act_id, goal_id: @goal_record.goal_id, name: @goal_record.name, quantity: @goal_record.quantity } }
    end

    assert_redirected_to goal_record_url(GoalRecord.last)
  end

  test "should show goal_record" do
    get goal_record_url(@goal_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_record_url(@goal_record)
    assert_response :success
  end

  test "should update goal_record" do
    patch goal_record_url(@goal_record), params: { goal_record: { act_id: @goal_record.act_id, goal_id: @goal_record.goal_id, name: @goal_record.name, quantity: @goal_record.quantity } }
    assert_redirected_to goal_record_url(@goal_record)
  end

  test "should destroy goal_record" do
    assert_difference('GoalRecord.count', -1) do
      delete goal_record_url(@goal_record)
    end

    assert_redirected_to goal_records_url
  end
end
