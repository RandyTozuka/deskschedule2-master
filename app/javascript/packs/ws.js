
// アドミページ
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

  // ユーザーページ
$(function(){
  $('#nonadmin_lastmonth_btn').click(function(){
    $('.namonth').removeClass('active');
    $('.nonadmin_lastmonth').addClass('active');
  })
  $('#nonadmin_thismonth_btn').click(function(){
    $('.namonth').removeClass('active');
    $('.nonadmin_thismonth').addClass('active');
  })
  $('#nonadmin_nextmonth_btn').click(function(){
    $('.namonth').removeClass('active');
    $('.nonadmin_nextmonth').addClass('active');
  })
});
