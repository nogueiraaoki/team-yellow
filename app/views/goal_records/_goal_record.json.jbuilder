json.extract! goal_record, :id, :name, :quantity, :goal_id, :act_id, :created_at, :updated_at
json.url goal_record_url(goal_record, format: :json)
