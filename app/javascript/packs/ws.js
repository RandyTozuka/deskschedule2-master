$(function(){
  $('#admin_lastmonth_btn').click(function(){
    $('.active').removeClass('active');
    $('.month').eq(0).addClass('active');
  })
});
