
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

  // ユーザーページ - メイン画面遷移
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
  // ユーザーページ - テーブルの行全体を選択可能に
  jQuery(function($) {
    //data-hrefの属性を持つtrを選択しclassにclickableを付加
    $('tr[data-href]').addClass('clickable')
      //クリックイベント
      .click(function(e) {
        //e.targetはクリックした要素自体、それがa要素以外であれば
        if(!$(e.target).is('a')){
          //その要素の先祖要素で一番近いtrの
          //data-href属性の値に書かれているURLに遷移する
          window.location = $(e.target).closest('tr').data('href');}
    });
  });
