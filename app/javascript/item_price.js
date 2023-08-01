document.addEventListener('turbo:load', function(){
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");


priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const taxAmount = Math.floor(inputValue * 0.1);
   const profit = inputValue - taxAmount;
   addTaxDom.innerHTML = taxAmount;
   profitDom.innerHTML = profit;
});
});