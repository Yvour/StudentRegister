json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :first_name_value, :last_name_value, :birthdate, :email, :registration_time, :registration_ip, :grades
  json.url student_url(student, format: :json)
end
