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
                              text0 += td('<div class = "grades" id = "otzenka'+student.id+'" style = "border: 1px solid blue;" data-grades = ' + JSON.stringify(student.grades, '"', '\"') + '>Оценки</div>');
                              text0 += '</tr>';
                              $('#student_table > tbody').append(text0);
                             

                              ///  alert(JSON.stringify(student.grades));
                    });
// Установка обработчиков.
                    $('.grades').on('click', function() {
                        

                              if ($(this).html() == 'Оценки') {
                                        alert ($(this).data('grades'));
                                        alert($.parseJSON($(this).data('grades')));
                                        var grades = $(this).data('grades');
                                        var obj = JSON.parse( $(this).data('grades'));
                                        if (obj.size>0) alert(1);
                                        else
                                        alert(0);

                                    
                              } else {$(this).html('Оценки');};
                    });

          });
}


$(document).ready(function() {

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