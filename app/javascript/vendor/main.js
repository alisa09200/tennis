$(function(){
  // 
  var duration = 300;

  // aside ----------------------------------------
  var $aside = $('.page-main > aside');
  var $asidButton = $aside.find('button')
    .on('click', function(){
      $aside.toggleClass('open');
      if($aside.hasClass('open')){
        $aside.stop(true).animate({left: '-70px'}, duration, 'easeOutBack');
        $asidButton.find('img').attr('src', '/assets/btn_close.png');
      }else{
        $aside.stop(true).animate({left: '-350px'}, duration, 'easeInBack');
        $asidButton.find('img').attr('src', '/assets/btn_open.png');
      };
    });

});


$(function () {

  /*
   * Slideshow
   */
  // slideshow クラスを持った要素ごとに処理を実行
  $('.slideshow').each(function () {

      var $slides = $(this).find('img'), // すべてのスライド
          slideCount = $slides.length,   // スライドの点数
          currentIndex = 0;              // 現在のスライドを示すインデックス

      // 1 番目のスライドをフェードインで表示
      $slides.eq(currentIndex).fadeIn();

      // 7500 ミリ秒ごとに showNextSlide 関数を実行
      setInterval(showNextSlide, 7500);

      // 次のスライドを表示する関数
      function showNextSlide () {

          // 次に表示するスライドのインデックス
          // (もし最後のスライドなら最初に戻る)
          var nextIndex = (currentIndex + 1) % slideCount;

          // 現在のスライドをフェードアウト
          $slides.eq(currentIndex).fadeOut();

          // 次のスライドをフェードイン
          $slides.eq(nextIndex).fadeIn();

          // 現在のスライドのインデックスを更新
          currentIndex = nextIndex;
      }

  });

});