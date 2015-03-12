json.array!(@grades) do |grade|
  json.extract! grade, :id, :student_id, :semester_id, :discipline_id, :grade_value, :grade_value
  json.url grade_url(grade, format: :json)
end
