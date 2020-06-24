$(function() {
  // 必須の入力フォームが未入力の場合、エラーメッセージ
  $('input.required').on('blur', function() {
    var error; // エラー用の変数を定義
    if( $(this).val() === '' ) { // この要素のvalueが空文字だったらエラー
      error = true;
    }
    if( error ) {
      // エラーが見つかった場合
      if( !$(this).next('span.error').length ) { // この要素の後続要素が存在しない場合
        $(this).after('<span class="error">未入力です</span>'); // この要素の後にエラーメッセージを挿入
      }
    } else {
      // エラーがなかった場合
      $(this).next('span.error').remove(); // この要素の後続要素を削除
    }
  });


  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#user_img").change(function(){
      readURL(this);
  });

  // 投稿写真のプレビュー
  $('#myImage').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#prevImage").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });

})
