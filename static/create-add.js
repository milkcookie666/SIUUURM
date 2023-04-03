let countAllClients = 0;
// let countDop = 0;


function addCard() {
    for (let index = 0; index < countAllClients; index++) {
        const element = array[index];
        addAudit()
    }
}

document.onclick = function () {
    var elem = window.event.srcElement;
    if (elem.className === "btnlog") {
        countAllClients += 1;
        addAudit();
    }
};

var addAudit = function () {

    var elemKod = document.querySelector('.in-kod').innerHTML;
    var elemOutKod = document.querySelector('.out-kod');

    elemOutKod.innerHTML += '<div>' + elemKod + '</div>';

};


document.onclick = function () {
    var elem = window.event.srcElement;
    if (elem.className === "btn") {
        addAudit();
    }
};



