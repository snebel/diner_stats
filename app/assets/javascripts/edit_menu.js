// <restaurant data-pizza="pepperoni" data-id="<%= restaurant.id %>"> </restuarant>

// e.target.data('id');
// e.target.data('pizza');
var el;
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
  var li = $('<li>')
    .html("<a href='/menus/" + data.menu_id + '/sections/' + data.id + "/edit'>" + data.name + "</a>");    ;
  $('#sections').append(li);
}

$('.delete-section').on('click', function(e){
  e.preventDefault();
  // console.log(e);
  // e.target.parentElement.parent().remove(function() {
    // let's try to grab the li
  $('#' + e.target.id).remove();
  // });
  $.ajax({
    method: 'delete',
    dataType: 'json',
    url: '/sections/' + e.target.id,
    success: function(data){

    }
  })
});

