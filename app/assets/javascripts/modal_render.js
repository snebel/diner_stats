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
      $('#menu-item-show').append(a.children());
    },
    fail: function(error){
      console.log(err0r);
    }
  });
});