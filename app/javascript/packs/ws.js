
$(function(){
  $('#admin_lastmonth_btn').click(function(){
    $('.month').removeClass('active');
    $('.admin_lastmonth').addClass('active');
  })
  $('#admin_thismonth_btn').click(function(){
    $('.month').removeClass('active');
    $('.admin_thismonth').addClass('active');
  })
  $('#admin_nextmonth_btn').click(function(){
    $('.month').removeClass('active');
    $('.admin_nextmonth').addClass('active');
  })
});
