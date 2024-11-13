// 関数として定義
const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  
  if (!priceInput) return; // 要素が存在しない場合は処理を終了
  
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  if (!addTaxDom || !profitDom) return; // 必要な要素が存在しない場合は処理を終了

  // 初期表示の処理
  const initialValue = priceInput.value;
  if (initialValue) {
    updatePrice(initialValue, addTaxDom, profitDom);
  }

  // 入力時の処理
  priceInput.addEventListener("input", () => {
    updatePrice(priceInput.value, addTaxDom, profitDom);
  });
};

// 価格更新関数を定義
const updatePrice = (value, taxElement, profitElement) => {
  if (value === '') {
    taxElement.innerHTML = '0';
    profitElement.innerHTML = '0';
    return;
  }

  const price = parseInt(value, 10);
  if (isNaN(price)) return;

  const fee = Math.floor(price * 0.1);
  const profit = price - fee;

  taxElement.innerHTML = fee.toLocaleString();
  profitElement.innerHTML = profit.toLocaleString();
};

// DOMの読み込み完了時とTurbo遷移時に実行
document.addEventListener('DOMContentLoaded', calculatePrice);
document.addEventListener('turbo:load', calculatePrice);
document.addEventListener('turbo:render', calculatePrice);
