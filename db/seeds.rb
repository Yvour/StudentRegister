# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
Discipline.create(name:"Physics")
Discipline.create(name:"Art")

Semester.create(name:"One")
StudentGroup.create(name:"Main")


surnames = ["Scott", "Walter", "Edmond", "Lyndon"]

sg = StudentGroup.first

surnames.map{ |surname|
  i = 1000
  while i>0 do
    s  = Student.new
    s.first_name_value = "Oliver"+i.to_s
    s.last_name_value = surname
    s.registration_ip = "3.4.5.6"+i.to_s
    s.registration_time = Time.now
    s.birthdate = Date.today
    s.student_group = sg
    s.email = "w"+i.to_s + surname

    s.save
    i-=1
  end
}
=end
d = Discipline.all.ids;
s = Semester.all.ids;
st = Student.all.ids;
st.map{
  |student_id |
  d.map{ |discipline_id|  
    s.map { |semester_id|  Grade.create(student_id: student_id, discipline_id: discipline_id, semester_id: semester_id, grade_value: rand(3)+2) }
  }
     
 
  
}  

