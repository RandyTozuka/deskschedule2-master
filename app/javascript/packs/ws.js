

// $(function(){
//   $('#admin_thismonth_btn').click(function(){
//     $('.month').removeClass('active');
//   })
// });

$(document).on('turbolinks:load', function() {
  $('#admin_thismonth_btn').click(function(){
  $('.month').removeClass('active');
  })
});
