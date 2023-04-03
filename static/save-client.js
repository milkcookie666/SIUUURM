$(document).ready(function () {
    // Define variables
    let cellDeals1 = "Value 1";
    let cellDeals2 = "Value 2";
    let cellDeals3 = "Value 3";
    let cellDeals4 = "Value 4";
    let cellDeals5 = "Value 5";

    // Function to save table cell values to variables
    function saveValues() {
        cellDeals1 = $("#cellDeals-1").text();
        cellDeals2 = $("#cellDeals-2").text();
        cellDeals3 = $("#cellDeals-3").text();
        cellDeals4 = $("#cellDeals-4").text();
        cellDeals5 = $("#cellDeals-5").text();
    }

    // Save button click event
    $("#save-btn").click(function () {
        saveValues();
    });
});