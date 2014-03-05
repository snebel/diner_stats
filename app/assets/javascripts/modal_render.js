//ajax for rendering menu-item modal
$('.modal-link').on('click', function(e){
  e.preventDefault();
  // $('.modal-body').empty();

  $.ajax({
    method: 'get',
    url: '/menu_items/' + $(e.target).attr('id'),
    success: function(data){
      // console.log(data);
      a = $(data);
      $('.modal-body').empty();
      $('.modal-body').append(a.children());
    },
    fail: function(error){
      console.log(err0r);
    }
  });
});