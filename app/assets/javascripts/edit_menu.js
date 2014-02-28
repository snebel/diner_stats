
$('#add-section').on('click', function(){
  $.ajax({
    method: 'post',
    url: '/menus/' + $('#menu').val() + '/sections',
    // dataType: 'json',
    data: {name: $('#section-name').val()},
    success: function(data){
      console.log('success')
    },
    fail: function(data){
      console.log('FAIL');
    }
  })
});

