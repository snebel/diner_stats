//ajax for rendering menu-item and table modal

$('.modal-link').on('click', function(e){
  console.log('link clicked')
  e.preventDefault();
  target = $(e.target);
  var model = target.attr('data');
  if (model === 'item') {
    renderModal('/menu_items/' + target.attr('id'))
  }
  else if (model === 'table') {
    renderModal('/tables/' + target.attr('id'))
  }
  else if (model === 'new-table') {
    renderModal('/restaurants/1/tables/new')
  }
  else if (model === 'tables') {
    renderModal('/restaurants/1/tables')
  }
});

function renderModal(url){
  console.log('rendering')
  $.ajax({
    method: 'get',
    url: url,
    success: function(data){
      a = $(data);
      $('.modal-body').empty();
      $('.modal-body').append(a.children());
    },
    fail: function(error){
      console.log(error);
    }
  });
}