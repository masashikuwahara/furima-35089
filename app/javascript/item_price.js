window.addEventListener('load', () => {
  function price_cord(){
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const taxInputValue = Math.floor(inputValue / 10);
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue - taxInputValue);
  }

  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener("input", () => {
    price_cord();
  })

  price_cord();

});