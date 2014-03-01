
// ajax for seating a table/creating a meal
$('.create-meal').on('click', function(e){
  e.preventDefault();
  var table = $(e.target).parent()[0];
  var item_id = $(table).children('#menu_item')[0].value;
  var diners = $(table).children('#diners')[0].value;

  $.ajax({
    method: 'post',
    url: '/tables/' + table.id +'/meals',
    dataType: 'json',
    data: {diners: diners},
    success: function(data){
      console.log(data);
      $(table).css('background-color', 'red');
    },
    fail: function(data){
      console.log('seating failed')
    }
  });
});