

// $(function(){
//   $('#admin_thismonth_btn').click(function(){
//     $('.month').removeClass('active');
//   })
// });

$(document).on('turbolinks:load', function() {
  $('#admin_lastmonth_btn').click(function(){
  $('.admin_lastmonth').addClass('active');
  })
});
