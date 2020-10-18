function math () {
  const Tax = 0.1;
  const Price = document.getElementById("item-price");
  Price.addEventListener("keyup", () => {
    const ItemPrice = Price.value
    const TaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const TaxFee = ItemPrice * Tax;
    const afterTaxFee = Math.floor(TaxFee);
    const ProfitFee = ItemPrice - afterTaxFee;
    TaxPrice.innerHTML = afterTaxFee;
    Profit.innerHTML = ProfitFee;
  });
}

setInterval(math, 1000)