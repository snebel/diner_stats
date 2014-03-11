
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
  var section = $('<h3>').attr('id', data.id);
  var a = $("<a href='' class='modal-link'>")
    .attr('data', 'edit-section')
    .attr('id', data.id)
    .attr('menu-id', data.menu_id)
    .attr('data-toggle', 'modal')
    .attr('data-target', '#myModal')
    .text(data.name);
  section.append(a);
  section.append("<a class='delete-section' href=''><small> delete</small></a>");
  var div = $('<div>').attr('id', data.id)
  div.append(section);
  $('#sections').append(div);
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

$('.delete-item').on('click', function(e){
  e.preventDefault();
  var item = $(e.target).parents('h4');
  item.remove();

  $.ajax({
    method: 'delete',
    dataType: 'json',
    url: '/menu_items/' + item.attr('id')
  })
});

$('.add-item').on('click', function(e){
  e.preventDefault();
  
  $.ajax({
    method: 'post',
    url: '/menu_items',
    dataType: 'json',
    data: {
      name: $('#item-name').val(),
      price: $('#item-price').val(),
      section_id: $('#section_id').val()
    },
    success: function(data){
      console.log(data)
      $('#item-name').val('');
      $('#item-price').val('');
      var h4 = $('<h4>').attr('id', data.id)
        .text(data.name +' ($'+ parseFloat(data.price) +')')
        .append("<a class='delete-item' href><small> remove</small>");
      $('#section-items').append(h4);
    },
    failure: function(error){
      console.log(error);
    }
  });
});




