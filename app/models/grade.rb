class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :semester
  belongs_to :discipline
  
  after_save :average_to_student
  def average_to_student
    student = Student.find(self.student_id)
    grades = student.grades
    total = grades.inject(0) {|result,grade| result+=grade.grade_value}
    average = total / grades.size
    student.update(average_grade_value: average )
    
  end
end
