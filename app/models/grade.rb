class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :semester
  belongs_to :discipline
end
