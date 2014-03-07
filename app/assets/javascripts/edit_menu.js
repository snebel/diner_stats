// <restaurant data-pizza="pepperoni" data-id="<%= restaurant.id %>"> </restuarant>

// e.target.data('id');
// e.target.data('pizza');

$('#add-section').on('click', function(e){
  e.preventDefault();
  $.ajax({
    method: 'post',
    url: '/restaurants/' + $('#restaurant').val() + '/menus/' + $('#menu').val() + '/sections',
    data: {name: $('#section-name').val()},
    dataType: 'json',
    success: function(data){
      $('#section-name').val('');
      appendSection(data);      
    },
    fail: function(data){
      console.log('FAIL');
      alert('fails');
    }
  })
});

function appendSection(data) {
  var section = $('<h3>')
    .html("<a href='/menus/" + data.menu_id + '/sections/' + data.id + "/edit'>" + data.name + "</a>");
  section.attr('')
  section.append("<a class='delete-section' href=''><small> delete</small></a>")
  $('#sections').append(section);
}

$('.delete-section').on('click', function(e){
  e.preventDefault();
  var div = $(e.target).parents('div').first();
  div.remove()

  $.ajax({
    method: 'delete',
    dataType: 'json',
    url: '/sections/' + div.attr('id')
  })
});

