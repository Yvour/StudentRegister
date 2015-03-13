function td(s) {
          return '<td>' + s + '</td>';

}

function search() {
          var last_name = $('#last_name').val()
          var min_grade = $('#grade_value_from').val()
          var max_grade = $('#grade_value_to').val()
          var search = $('#search').val()
          var offset = $('#offset').val();
          if ('search1' == search) {
                    search1(last_name, min_grade, max_grade, offset);
          }

};


Disciplines = {}
Semesters = {}

function loadDisciplines()
{
           url = "http://localhost:3000/disciplines.json";
           $.getJSON(url, function(data) {
                     $.each(data, function(i, discipline){
                               Disciplines[discipline.id] = discipline.name;
                     });
           })
           
}
function loadSemesters()
{
           url = "http://localhost:3000/semesters.json";
           $.getJSON(url, function(data) {
                     $.each(data, function(i, Semester){
                               Semesters[Semester.id] = Semester.name;
                     });
           })
           
}


function search1(last_name, min_grade, max_grade, offset) {

          url = "http://localhost:3000/search1/" + last_name + "/" + min_grade + '/' + max_grade + '/' + offset + '.json';
          //offset is always zero

          $.getJSON(url, function(data) {

                    $('#student_table > tbody').html('');

                    var text0 = "";
                    $.each(data, function(i, student) {
                              text0 = "";
                              text0 += '<tr>';
                              text0 += td(student.first_name_value);
                              text0 += td(student.last_name_value);
                              text0 += td(student.birthdate);
                              text0 += td(student.email);
                              text0 += td(student.registration_time);
                              text0 += td(student.registration_ip);
                             // alert('land = ' + JSON.stringify(student.grades).replace(/'/g, "\\'"));
                              text0 += td('<div class = "grades" id = "otzenka'+student.id+'" style = "border: 1px solid blue;" data-grades = ' + JSON.stringify(student.grades).replace(/'/g, "\\'") + '>Оценки</div>');
                              text0 += '</tr>';
                              $('#student_table > tbody').append(text0);
                             

                              ///  alert(JSON.stringify(student.grades));
                    });
// Установка обработчиков.
                    $('.grades').on('click', function() {
                        

                              if ($(this).html() == 'Оценки') {
                                        grades =  JSON.parse( $(this).attr('data-grades') );
                                       // alert(grades);
                                        
                                        $(this).append('<table><tr><td>Семестр</td><td>Дисциплина</td><td>Оценка</td></tr>');
                                        for (var i = 0; i< grades.length; i++)
                                        {
                                                  //alert('i=' + i +';'+grades[i].discipline_id + ';' + grades[i].student_id + ';' + grades[i].semester_id + ';' + grades[i].grade_value);
                                                  var txt  = '<tr>'
                                                  txt += td(Semesters[grades[i].semester_id]);
                                                 // $(this).append(td(grades[i].student_id));
                                                  txt +=td(Disciplines[grades[i].discipline_id]);
                                                  txt +=td(grades[i].grade_value);
                                                  txt +='</tr>';
                                                  $(this).children('table').children('tbody').append(txt);
                                        };
                                       // $(this).append('</table>');
                                        
                             

                                    
                              } else {$(this).html('Оценки');};
                    });

          });
}


$(document).ready(function() {
          loadDisciplines();
          loadSemesters();
          

          $('#next').on('click', function() {
                    var offset = $('#offset').val();
                    try {
                              offset = parseFloat(offset);
                    } catch(e) {
                              offset = 0;
                    }

                    $('#offset').val(offset + 50);
                    search()
          });

          $('#prev').on('click', function() {
                    var offset = $('#offset').val();
                    try {
                              offset = parseFloat(offset);
                    } catch(e) {
                              offset = 0;
                    }

                    offset -= 50;
                    if (offset < 0)
                              offset = 0
                    $('#offset').val(offset);
                    search();
          });

          $('#search1').on('click', function() {
                    var last_name = $('#last_name').val()
                    var min_grade = $('#grade_value_from').val()
                    var max_grade = $('#grade_value_to').val()
                    $('#offset').val('0');
                    // Сброс сброс смещения после поиска
                    $('#search').val('search1');

                    search1(last_name, min_grade, max_grade, 0);

          })
})