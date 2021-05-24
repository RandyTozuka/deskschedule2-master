
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

// 参考;
// https://www.tam-tam.co.jp/tipsnote/javascript/post9911.html
// https://www.sejuku.net/blog/22925
$(function(){
  $('#submit').click(function(){
    //今日の日付データを変数todayに格納
    var today = new Date();
    //月を取得
    var this_month = today.getMonth()+1;
    // 先月
    var last_month = today.getMonth();
    // 来月
    var next_month = today.getMonth()+2;
    // URLのパラメータを取得 substring(1)とすることで2文字目以降［?以外］を取得
    var urlParam = location.search.substring(1);
    // URLにパラメータが存在する場合
    if(urlParam) {
      // 「&」が含まれている場合は「&」で分割
      var param = urlParam.split('&');
      // パラメータを格納するための配列を用意
      var paramArray = [];

      // 用意した配列にパラメータを格納
      for (i = 0; i < param.length; i++) {
        var paramItem = param[i].split('=');
        paramArray[paramItem[0]] = paramItem[1];
      }
      // paramArrayに入っているwday（文字列）を日付データに変換し何月であるかを求める
      m = Date.parse(paramArray.wday).month
      if (m == last_month) {
        $('.namonth').removeClass('active');
        $('.nonadmin_lastmonth').addClass('active');
      }
      if (m == this_month) {
        $('.namonth').removeClass('active');
        $('.nonadmin_thismonth').addClass('active');
      }
      if (m == next_month) {
        $('.namonth').removeClass('active');
        $('.nonadmin_nextmonth').addClass('active');
      }
    }
  })
});
