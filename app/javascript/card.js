// pay関数を定義
const pay = () => {
  // PAY.JPの公開鍵を取得（controllerでgon.public_keyに設定された値）
  const publicKey = gon.public_key;
  
  // PAY.JPのライブラリを初期化
  const payjp = Payjp(publicKey);
  
  // PAY.JPのElementsインスタンスを生成
  const elements = payjp.elements();
  
  // クレジットカード情報入力用の要素を作成
  const numberElement = elements.create('cardNumber');  // カード番号入力フォーム
  const expiryElement = elements.create('cardExpiry');  // 有効期限入力フォーム
  const cvcElement = elements.create('cardCvc');        // CVC入力フォーム

  // 作成したElementsをDOM上にマウント（表示）
  numberElement.mount("#number-form");  // id="number-form"の要素にカード番号入力フォームを表示
  expiryElement.mount("#expiry-form");  // id="expiry-form"の要素に有効期限入力フォームを表示
  cvcElement.mount("#cvc-form");        // id="cvc-form"の要素にCVC入力フォームを表示

  // フォームの送信イベントを処理
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();  // フォームのデフォルトの送信処理を停止

    // PAY.JPのAPIを使用してトークンを作成
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーが発生した場合の処理
        // ここにエラーハンドリングのコードを追加できます
      } else {
        // トークンの作成に成功した場合
        const token = response.id;  // レスポンスからトークンを取得
        
        // フォームにトークンを追加
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;  // hidden入力フィールドを作成
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  // フォームの最後にトークン用のinput要素を追加
      }

      // 入力フォームをクリア
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      // フォームを送信
      document.getElementById("charge-form").submit();
    });
  });
};

// Turboを使用している場合のイベントリスナー
window.addEventListener("turbo:load", pay);   // ページ読み込み時にpay関数を実行
window.addEventListener("turbo:render", pay); // ページ再描画時にpay関数を実行