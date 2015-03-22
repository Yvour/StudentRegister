#!/bin/env ruby
# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Discipline.create(name:"Physics")
Discipline.create(name:"Art")

Semester.create(name:"One")
StudentGroup.create(name:"Main")


names = ['Адамс',
'Аллисон',
'Барретт',
'Белл',
'Битти',
'Блейк',
'Боу',
'Браз',
'Брукс',
'Бьюкенен',
'Вальтер',
'Вашингтон',
'Вудворд',
'Гаррисон',
'Герни',
'Грей',
'Дейл',
'Джевонс',
'Джексон',
'Джонс',
'Джонсон',
'Дуглас',
'Зильберман',
'Инглис',
'Инджерсолл',
'Истмен',
'Йондж',
'Кавендиш',
'Кард',
'Карр',
'Картрайт',
'Кейн',
'Кеннеди',
'Кер',
'Китон',
'Кокс',
'Коллинз',
'Корти',
'Коулман',
'Купер',
'Лавджой',
'Ларкин',
'Ливермор',
'Линдлей',
'Льюис',
'Майлз',
'Маррей',
'Мид',
'Митчелл',
'Морган',
'Моррис',
'Мур',
'Мёрфи',
'Оуэн',
'Паркер',
'Перл',
'Портер',
'Пёрселл',
'Рассел',
'Расселл',
'Резерфорд',
'Рейнольдс',
'Рид',
'Ричардсон',
'Ричи',
'Робертсон',
'Росс',
'Сандерс',
'Сильверман',
'Сильверстайн',
'Скотт',
'Смит',
'Стоун',
'Томпсон',
'Трейси',
'Тэтчер',
'Уайлдер',
'Уилкинс',
'Уистлер',
'Уитакер',
'Уэйанс',
'Фаулер',
'Фишер',
'Флиндерс',
'Хаггинс',
'Хант',
'Харрисон',
'Хейз',
'Херст',
'Хокинс',
'Холли',
'Хэйл',
'Чедвик',
'Шоу',
'Эванс']

sg = StudentGroup.first
students = []
indx = 0
names.map{ |name0 |
names.map{ |surname|
  i = 1
  while i>0 do
    s  = Student.new
    s.first_name_value = name0
    s.last_name_value = surname
    s.registration_ip = "3.4.5.6"+i.to_s
    s.registration_time = Time.now
    s.birthdate = Date.today
    s.student_group = sg
    s.email = "w"+indx.to_s + surname

    students.push(s)
    i-=1
    indx+=1
  end
}
}
puts "the count is " + students.size.to_s
students.map{|st| st.save}

d = Discipline.all.ids;
s = Semester.all.ids;
st = Student.all.ids;
st.map{
  |student_id |
  d.map{ |discipline_id|  
    s.map { |semester_id|  Grade.create(student_id: student_id, discipline_id: discipline_id, semester_id: semester_id, grade_value: rand(3)+2) }
  }
     
 
  
}  

