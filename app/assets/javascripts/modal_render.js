//ajax for rendering menu-item and table modal

$('.modal-link').on('click', function(e){
  $('.modal-body').empty();
  var target = $(e.target);
  var model = target.attr('data');
  var id = target.attr('id');

  if (model === 'item') {
    renderModal('/menu_items/' + id)
  }
  else if (model === 'table') {
    renderModal('/tables/' + id)
  }
  else if (model === 'new-table') {
    renderModal('/restaurants/' + id + '/tables/new')
  }
  else if (model === 'tables') {
    renderModal('/restaurants/' + id +'/tables')
  }
  else if (model === 'view-menu') {
    renderModal('/restaurants/' + id + '/menus/' + target.attr('menu-id') + '/edit')
  }
  else if (model === 'edit-section') {
    renderModal('/menus/' + target.attr('menu-id') + '/sections/' + id + '/edit');
  }
});

function renderModal(url){
  $.ajax({
    method: 'get',
    url: url,
    success: function(data){
      $('.modal-body').empty();
      $('.modal-body').append($(data).children());
    },
    error: function(error){
      console.log(error);
      $('.modal-body').append('Not a current menu item.');
    }
  });
}
