$(document).ready(function () {
    // Define variables
    let productName1 = "Value 1-1";
    let productName2 = "Value 2-1";
    let productName3 = "Value 3-1";
    let productName4 = "Value 4-1";
    let productName5 = "Value 5-1";

    let quantityOfGoods1 = "Value 1-1";
    let quantityOfGoods2 = "Value 1-1";
    let quantityOfGoods3 = "Value 1-1";
    let quantityOfGoods4 = "Value 1-1";
    let quantityOfGoods5 = "Value 1-1";

    let sum1 = "Value 1-1";
    let sum2 = "Value 1-1";
    let sum3 = "Value 1-1";
    let sum4 = "Value 1-1";
    let sum5 = "Value 1-1";

    // Function to save table cell values to variables
    function saveValues() {
        productName1 = $("#product-name-1").text();
        productName2 = $("#product-name-2").text();
        productName3 = $("#product-name-3").text();
        productName4 = $("#product-name-4").text();
        productName5 = $("#product-name-5").text();

        quantityOfGoods1 = $("#quantity-of-goods-1").text();
        quantityOfGoods2 = $("#quantity-of-goods-2").text();
        quantityOfGoods3 = $("#quantity-of-goods-3").text();
        quantityOfGoods4 = $("#quantity-of-goods-4").text();
        quantityOfGoods5 = $("#quantity-of-goods-5").text();

        sum1 = $("#sum-1").text();
        sum2 = $("#sum-2").text();
        sum3 = $("#sum-3").text();
        sum4 = $("#sum-4").text();
        sum5 = $("#sum-5").text();

    }

    // Save button click event
    $("#save-btn").click(function () {
        saveValues();
    });

    // Deals button click event
    // $("#deals-btn").click(function () {
    //     // Redirect to deals page
    //     window.location.href = "deals.html";
    // });
});