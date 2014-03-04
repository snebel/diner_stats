//ajax for rendering menu-item modal
$('.modal-link').on('click', function(e){
  e.preventDefault();
  $('.modal-title').empty();
  $('#menu-item-show').empty();

  $.ajax({
    method: 'get',
    url: '/menu_items/' + $(e.target).attr('id'),
    success: function(data){
      // console.log(data);
      a = $(data);
      $('.modal-title').append(a.children('h1'))
      $('#menu-item-show').append(a.children('table'));
    },
    fail: function(error){
      console.log(err0r);
    }
  });
});