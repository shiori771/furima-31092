function math () {
  const Tax = 0.1;
  const Price = document.getElementById("item-price");
  Price.addEventListener("keyup", () => {
    const ItemPrice = Price.value
    const TaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const beforeTax = ItemPrice * Tax;
    const afterTaxFee = Math.floor(beforeTax);
    const ProfitPrice = ItemPrice - afterTaxFee;
    TaxPrice.innerHTML = afterTaxFee;
    Profit.innerHTML = ProfitPrice;
  });
}

setInterval(math, 1000)