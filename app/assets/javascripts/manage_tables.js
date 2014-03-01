
// ajax for seating a table/creating a meal
$('.create-meal').on('click', function(e){
  e.preventDefault();
  var table = $(e.target).parent()[0];
  // var item_id = $(table).children('#menu_item')[0].value;
  var diners = $(table).children('#diners')[0].value;

  $.ajax({
    method: 'post',
    url: '/tables/' + table.id +'/meals',
    dataType: 'json',
    data: {diners: diners},
    success: function(data){
      $(table).css('background-color', 'red');
      $(table).children('.end-meal').attr('id', data.id);
    },
    fail: function(data){
      console.log('seating failed')
    }
  });
});

//ajax for ending/updating a meal
$('.end-meal').on('click', function(e){
  e.preventDefault();
  console.log(e.target)
  var table = $(e.target).parent()[0];

  $.ajax({
    method: 'put',
    url: '/tables/' + table.id + '/meals/' + e.target.id,
    dataType: 'json',
    data: {},
    success: function(data){
      $(table).css('background-color', 'lightgreen');
    },
    error: function(data){
      console.log('end meal failed');
    }
  });
})




